Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:33793 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1760263AbdKRD04 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 17 Nov 2017 22:26:56 -0500
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-hwmon@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, linux@roeck-us.net,
        robh+dt@kernel.org, mark.rutland@arm.com, jdelvare@suse.com,
        corbet@lwn.net, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: [PATCH v5 3/4] pmbus (core): Add virtual page config bit
Date: Sat, 18 Nov 2017 13:56:05 +1030
Message-Id: <c5ccfeab881181dfbfdbdfb26051bb4cd332f6e6.1510974230.git-series.andrew@aj.id.au>
In-Reply-To: <cover.8f64654fcede136901874050318e64de7f1a68cb.1510974230.git-series.andrew@aj.id.au>
References: <cover.8f64654fcede136901874050318e64de7f1a68cb.1510974230.git-series.andrew@aj.id.au>
In-Reply-To: <cover.8f64654fcede136901874050318e64de7f1a68cb.1510974230.git-series.andrew@aj.id.au>
References: <cover.8f64654fcede136901874050318e64de7f1a68cb.1510974230.git-series.andrew@aj.id.au>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Some circumstances call for virtual pages, to expose multiple values
packed into an extended PMBus register in a manner non-compliant with
the PMBus standard. An example of this is the Maxim MAX31785 controller, which
extends the READ_FAN_SPEED_1 PMBus register from two to four bytes to support
tach readings for both rotors of a dual rotor fan. This extended register
contains two word-sized values, one reporting the rate of the fastest rotor,
the other the rate of the slowest. The concept of virtual pages aids this
situation by mapping the page number onto the value to be selected from the
vectored result.

We should not try to set virtual pages on the device as such a page explicitly
doesn't exist; add a flag so we can avoid doing so.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/pmbus/pmbus.h      |  2 ++
 drivers/hwmon/pmbus/pmbus_core.c | 10 +++++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index b54d7604d3ef..d39d506aa63e 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -372,6 +372,8 @@ enum pmbus_sensor_classes {
 #define PMBUS_HAVE_PWM12	BIT(20)
 #define PMBUS_HAVE_PWM34	BIT(21)
 
+#define PMBUS_PAGE_VIRTUAL	BIT(31)
+
 enum pmbus_data_format { linear = 0, direct, vid };
 enum vrm_version { vr11 = 0, vr12, vr13 };
 
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 631db88526b6..ba97230fcde7 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -164,14 +164,18 @@ int pmbus_set_page(struct i2c_client *client, int page)
 	int rv = 0;
 	int newpage;
 
-	if (page >= 0 && page != data->currpage) {
+	if (page < 0 || page == data->currpage)
+		return 0;
+
+	if (!(data->info->func[page] & PMBUS_PAGE_VIRTUAL)) {
 		rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
 		newpage = i2c_smbus_read_byte_data(client, PMBUS_PAGE);
 		if (newpage != page)
 			rv = -EIO;
-		else
-			data->currpage = page;
 	}
+
+	data->currpage = page;
+
 	return rv;
 }
 EXPORT_SYMBOL_GPL(pmbus_set_page);
-- 
git-series 0.9.1
