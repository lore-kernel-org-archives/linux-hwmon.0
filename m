Return-path: <elfring@users.sourceforge.net>
To: linux-hwmon@vger.kernel.org, =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?=
 <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 0/4] hwmon-NCT: Fine-tuning for four function implementations
Message-ID: <2f58a509-4aba-5c44-bc79-568b260ab692@users.sourceforge.net>
Date: Thu, 27 Apr 2017 11:27:21 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 27 Apr 2017 11:18:22 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  Use devm_kcalloc() in nct6683_create_attr_group()
  Adjust five checks for null pointers
  Use devm_kcalloc() in nct6775_create_attr_group()
  Adjust seven checks for null pointers

 drivers/hwmon/nct6683.c | 15 +++++++--------
 drivers/hwmon/nct6775.c | 19 +++++++++----------
 2 files changed, 16 insertions(+), 18 deletions(-)

-- 
2.12.2
