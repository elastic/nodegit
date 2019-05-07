var NodeGit = require("../");
var shallowClone = NodeGit.Utils.shallowClone;
var normalizeOptions = NodeGit.Utils.normalizeOptions;

var Worktree = NodeGit.Worktree;
var _prune = Worktree.prototype.prune;
var _add = Worktree.add;

Worktree.add = function(repo, name, dir, options) {
  if (options) {
    options = shallowClone(options);
  } else {
    options = { lock:0, version: 1 };
  }
  options = normalizeOptions(options, NodeGit.WorktreeAddOptions);
  return _add.call(this, repo, name, dir, options);
};

Worktree.prototype.prune = function(options) {
  if (options) {
    options = shallowClone(options);
  }
  options = normalizeOptions(options, NodeGit.WorktreePruneOptions);
  return _prune.call(this,  options);
};

