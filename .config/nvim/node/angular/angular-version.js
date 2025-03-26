const fs = require("node:fs");

class Version {
  major;
  minor;
  patch;
  versionStr;

  constructor(versionStr) {
    const [major, minor, patch] = Version.parseVersionStr(versionStr);
    this.major = major;
    this.minor = minor;
    this.patch = patch;
    this.versionStr = versionStr;
  }

  static parseVersionStr(versionStr) {
    const [major, minor, patch] = versionStr
      .split(".")
      .map(parseNonNegativeInt);
    return [
      major === undefined ? 0 : major,
      minor === undefined ? 0 : minor,
      patch === undefined ? 0 : patch,
    ];
  }
}

function parseNonNegativeInt(a) {
  // parseInt() will try to convert as many as possible leading characters that
  // are digits. This means a string like "123abc" will be converted to 123.
  // For our use case, this is sufficient.
  const i = parseInt(a, 10 /* radix */);
  return isNaN(i) ? -1 : i;
}

const expectedArgNo = 2;

const args = process.argv.slice(2);

if (args.length != expectedArgNo) {
  console.error("Wrong args");
  process.exit(1);
}

const root = args[0];
const packageName = args[1];

const packageJsonPath = require.resolve(`${packageName}/package.json`, {
  paths: [root],
});
const packageJson = JSON.parse(fs.readFileSync(packageJsonPath, "utf8"));

const resolvedPath = require.resolve(packageName, {
  paths: [root],
});

const resolvedPackage = {
  name: packageName,
  resolvedPath,
  version: new Version(packageJson.version),
};

console.log(JSON.stringify(resolvedPackage));
