using Godot;
using System;

enum MechState
{
    Idle,
    Walking,
    Jumping,
    Falling,
    Boosting
}

public partial class Mech1 : CharacterBody2D
{
    public const float Speed = 300.0f;
    public const float JumpVelocity = -400.0f;

    private Vector2 _gravity = new Vector2(0, 10);

    private AnimatedSprite2D _animatedSprite2D;
    private MechState _state = MechState.Idle;
    
    public override void _Ready()
    {
        _animatedSprite2D = GetNode<AnimatedSprite2D>("AnimatedSprite2D");
    }

    public override void _PhysicsProcess(double delta)
    {
        HandleGravity(delta);
        HandlePlayerInteraction(delta);

        MoveAndSlide();
    }

    private void HandlePlayerInteraction(double delta)
    {
        var velocity = Velocity;
        var direction = Input.GetVector("ui_left", "ui_right", "ui_up", "ui_down");
        
        if (direction != Vector2.Zero)
        {
            _animatedSprite2D.Play("walking");
            velocity.X = direction.X * Speed;
            
            _animatedSprite2D.Scale = direction.X < 0 ? new Vector2(-1, 1) : new Vector2(1, 1);
        }
        else
        {
            _animatedSprite2D.Play("idle");
            velocity.X = Mathf.MoveToward(Velocity.X, 0, Speed);
        }
        
        Velocity = velocity;
    }

    private void HandleGravity(double delta)
    {
        if (!IsOnFloor())
        {
            Velocity = Velocity += _gravity * (float)delta;
        }
    }

    private void HandleBoosting(double delta)
    {
        // if (Input.IsActionJustPressed("ui_accept") && IsOnFloor())
        // {
        //     velocity.Y = JumpVelocity;
        // }
    }
}
