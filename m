Return-Path: <xow@google.com>
Return-path: <xow@google.com>
From: Xo Wang <xow@google.com>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	corbet@lwn.net
Cc: Xo Wang <xow@google.com>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH 0/2] Add hwmon support for TI LM5066I hotswap controller
Date: Tue, 29 Aug 2017 14:21:15 -0700
Message-Id: <20170829212117.143441-1-xow@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-ID: <linux-hwmon@vger.kernel.org>

Tested with hardware on Aspeed AST2500 connected to LM5066I on a custom board.

Xo Wang (2):
  hwmon: (pmbus/lm25066) Offset coefficient depends on CL
  hwmon: (pmbus/lm25066) Add support for TI LM5066I

 Documentation/hwmon/lm25066   |  9 +++++++--
 drivers/hwmon/pmbus/lm25066.c | 47 +++++++++++++++++++++++++++++++++++++++----
 2 files changed, 50 insertions(+), 6 deletions(-)

-- 
2.14.1.342.g6490525c54-goog
