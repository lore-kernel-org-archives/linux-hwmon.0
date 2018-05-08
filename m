Return-Path: <lucasrangit@gmail.com>
Return-path: <lucasrangit@gmail.com>
Sender: Lucas Rangit Magasweran <lucasrangit@gmail.com>
From: Lucas Magasweran <lucas.magasweran@ieee.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Lucas Magasweran <lucas.magasweran@ieee.org>
Subject: [PATCH] hwmon: (core) check parent dev != NULL when chip != NULL
Date: Tue,  8 May 2018 04:43:32 -0700
Message-Id: <1525779813-25716-1-git-send-email-lucas.magasweran@ieee.org>
In-Reply-To: <20180504223950.GA5392@roeck-us.net>
References: <20180504223950.GA5392@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Guenter, thank you for clarifying the usage of the registration API.

Here is a proposed patch that checks for NULL parent if chip is non-NULL
to avoid the null pointer dereference when used incorrectly with an 
update to the documentation.

--

Lucas Magasweran (1):
  hwmon: (core) check parent dev != NULL when chip != NULL

 Documentation/hwmon/hwmon-kernel-api.txt | 3 ++-
 drivers/hwmon/hwmon.c                    | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

-- 
2.7.4
