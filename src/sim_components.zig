const std = @import("std");

pub const name_max_length = 24;

/// If reaches 0, student / mentor disintergrates.
/// When full, students gain proficiency boost in preffered branch, mentors will train better.
pub const Morale = u8;

pub const Age = u8;

// Cost to build a module
pub const Cost = u64;

// Branch specific cost to unlock module
pub const BranchPoint = u16;

// Branch specific work cost to build module
pub const WorkUnit = u8;

pub const Team = struct {
    name: [name_max_length]u8,
    funds: i64,
    energy: i8,
    fame: i8,
    popularity: i8,
    branch_points: std.EnumMap(Branch, BranchPoint),
    students: std.ArrayList(Student),
    mentors: std.ArrayList(Mentor),
    robots: std.ArrayList(Robot),
};

pub const Workspace = struct {
    work_decrease: std.EnumMap(Branch, WorkUnit),
};

pub const Student = struct {
    name: [name_max_length]u8,
    age: Age,
    morale: Morale,
    preferred_branch: Branch,
    branch_proficiency: std.EnumMap(Branch, u8), // Work units available per week
};

pub const Mentor = struct {
    name: [name_max_length]u8,
    branch: Branch,
    work_boost: WorkUnit, // mentors have small work unit boost
};

pub const Branch = enum {
    strategy,
    mechanical,
    electrical,
    software,
};

pub const Robot = struct {
    pub const Stat = enum {
        agility,
        speed,
        drivability,
        durability,
        climbing,
        accuracy,
        aesthetics,
    };

    name: [name_max_length]u8,
    cost: Cost,
    stats: std.EnumMap(Stat, f32),
    modules: std.ArrayList(Module),
};

pub const Module = struct {
    name: [name_max_length]u8,
    cost: Cost,
    branch: Branch,
    branch_point_cost: BranchPoint,
    branch_work_cost: WorkUnit,
};

pub const CompRoles = enum {
    driveTeam,
    pitCrew,
    scout,
    media,
};
