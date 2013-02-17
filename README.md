# ispconfig-review-host

Quickly generate review-host test files for all your ISPConfig domains.

## Requirements

- [phantomjs](https://github.com/ariya/phantomjs/)
- [review](https://github.com/juliangruber/review)
- [review-host](https://github.com/juliangruber/review-host)

## Installation

```bash
$ npm install -g review-host
$ git clone git@github.com:aeyoll/ispconfig-review-host.git
```

## Configuration

Change the first lines of `create-websites-reviews.sh` with your own MySQL parameters to the ISPConfig DB:

```bash
db_user="@USER@"
db_password="@PASSWORD@"
db_host="@HOST@"
```

## Usage

To generate review-host-files:

```bash
$ ./create-websites-reviews.sh
```

Then, just use review-host normaly:

```bash
$ review-host
review-host listening on port 8899
```

To view the screenshots, check your browser at `http://localhost:8899/`
