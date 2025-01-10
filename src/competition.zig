pub const Competition = struct {
    climb: ClimbType,
    elem1: GameElement,
    elem2: ?GameElement,
};

pub const ClimbType = enum {};

pub const GameElement = struct {
    pub const Shape = enum {};
    pub const ScoringMethod = enum {};

    shape: Shape,
    scoring_method: ScoringMethod,
};
