Received: from k25.k3ae2098.use4.send.mailgun.net (k25.k3ae2098.use4.send.mailgun.net [204.220.183.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89764BAA1A
	for <linux-hwmon@vger.kernel.org>; Wed, 16 Sep 2026 22:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=204.220.183.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789597305; cv=none; b=B5i/vzRtVhuNTM9Y/mBBCzs+vz86E0weh2Vn4y2sVUL+tbCSYgr7BBVxkHTbQz48djymDVG9+f7fR07Dhi3gSMxrQBobmLhOpOChGg6nvqxjdrylt1egb1vWKR5YkciCiHsDkZOQnuRehuyulirSQU8X6LIozKytSmoJDfXxA4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789597305; c=relaxed/simple;
	bh=XirUPjKgYnLGE0iepLt/+c0IEvC+K1+V3X3HhpmBuIk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bf5bmRGeDHpfFCIbF95afkDYwlWVCT8zZukRzZmPS1ypfwkWKzoGzIlwZ98wART7yna6LypfodnCaUN7D2KNVmyRhs0rdPSjji7Lr+hGk09KMe8RaX4txwRqTcpjte4TnPNCoxat3RKvYzE1uPxsd0ZZRDrq216BcaPklwLA/T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=equiv.tech; spf=pass smtp.mailfrom=equiv.tech; dkim=pass (2048-bit key) header.d=equiv.tech header.i=@equiv.tech header.b=kkQLXt+l; arc=none smtp.client-ip=204.220.183.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=equiv.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=equiv.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=equiv.tech header.i=@equiv.tech header.b="kkQLXt+l"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=equiv.tech; q=dns/txt; s=pdk1; t=1789597288; x=1789604488;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Subject: Cc: To: To: From: From: Sender: Sender;
 bh=9Jx+ZMihMrOwkf77HEaScdT13YyLh2kz4eqVsGu+914=;
 b=kkQLXt+l0v/V+BqitNb/y0hJlU5Im2p+FiuLoTTxJT/B4dGjGehc8T74lZcGBhk+frq+KDGMsrLE9SbQ7RqvV+qWuldsjlk8VGZuUQ//Uc0/VYFnc87XIHAUipOACm5HI+MWN5MOjMjDfqXyehaLmQONbmeXSqaZ4ACR7BeEDo12+GMa/2FVWX0YKxppUdo6XXrYLdMcHivXk5whd4xxHsfVJ48/nq5QYD6qj5pC38SyrjINkROoQo/gwVOGxKlUkMPN1S1VPhOsxlTPgFMifDp8ggieRXisuqDrzmZ6y27SMqJxf3g87G/n4/ID5UZaL+vmc5IJbSmwfpioKgHVOw==
X-Mailgun-Sid: WyJkOWUwNSIsImxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZyIsIjkzZDVhYiJd
Received: from mail.equiv.tech (equiv.tech [142.93.28.83]) by
 a0257b1dc05eb87ae5782024d79ced72a9ecc6fcd8b634f7ff81a8c152d1d5eb with SMTP id
 6aab1668f473cbd189eb5593 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 16 Sep 2026 22:21:28 GMT
X-Mailgun-Sending-Ip: 204.220.183.25
Sender: james@equiv.tech
From: James Seo <james@equiv.tech>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>,
	James Seo <james@equiv.tech>
Subject: [PATCH] hwmon: (hp-wmi-sensors) Improve raw WMI string handling
Date: Wed, 16 Sep 2026 15:19:15 -0700
Message-ID: <20260916221912.434119-5-james@equiv.tech>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit c9ba59258094 ("hwmon: (hp-wmi-sensors) Fix failure to load on
EliteDesk 800 G6") left out some logic for recognizing raw WMI
strings in check_numeric_sensor_wobj(). This issue was reported by a
user along with an incomplete and unsuitable proposed solution [1].

Add the missing logic and properly remedy the issue. Also slightly
refactor how raw WMI strings are recognized elsewhere to make the
intent that they should be treated as regular ACPI strings clearer.

Reported-by: Muhammad Bilal <meatuni001@gmail.com>
Link: https://lore.kernel.org/linux-hwmon/20260916002907.161210-1-meatuni001@gmail.com/ [1]
Fixes: c9ba59258094 ("hwmon: (hp-wmi-sensors) Fix failure to load on EliteDesk 800 G6")
Signed-off-by: James Seo <james@equiv.tech>
---
 drivers/hwmon/hp-wmi-sensors.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/hp-wmi-sensors.c b/drivers/hwmon/hp-wmi-sensors.c
index 03c684ba83bd..cb2eb9bd278a 100644
--- a/drivers/hwmon/hp-wmi-sensors.c
+++ b/drivers/hwmon/hp-wmi-sensors.c
@@ -526,14 +526,12 @@ static int check_wobj(const union acpi_object *wobj,
 	for (prop = 0; prop <= last_prop; prop++) {
 		type = elements[prop].type;
 		valid_type = property_map[prop];
-		if (type != valid_type) {
-			if (type == ACPI_TYPE_BUFFER &&
-			    valid_type == ACPI_TYPE_STRING &&
-			    is_raw_wmi_string(elements[prop].buffer.pointer,
-					      elements[prop].buffer.length))
-				continue;
+		if (type == ACPI_TYPE_BUFFER &&
+		    is_raw_wmi_string(elements[prop].buffer.pointer,
+				      elements[prop].buffer.length))
+			type = ACPI_TYPE_STRING;
+		if (type != valid_type)
 			return -EINVAL;
-		}
 	}
 
 	return 0;
@@ -579,6 +577,7 @@ static int check_numeric_sensor_wobj(const union acpi_object *wobj,
 	int prop = HP_WMI_PROPERTY_NAME;
 	acpi_object_type valid_type;
 	union acpi_object *elements;
+	union acpi_object *element;
 	u32 elem_count;
 	int last_prop;
 	bool is_new;
@@ -602,13 +601,20 @@ static int check_numeric_sensor_wobj(const union acpi_object *wobj,
 	    elem_count > HP_WMI_MAX_PROPERTIES)
 		return -EINVAL;
 
-	type = elements[HP_WMI_PROPERTY_SIZE].type;
+	element = &elements[HP_WMI_PROPERTY_SIZE];
+	type = element->type;
 	switch (type) {
 	case ACPI_TYPE_INTEGER:
 		is_new = true;
 		last_prop = HP_WMI_PROPERTY_RATE_UNITS;
 		break;
 
+	case ACPI_TYPE_BUFFER:
+		if (!is_raw_wmi_string(element->buffer.pointer,
+				       element->buffer.length))
+			return -EINVAL;
+		fallthrough;
+
 	case ACPI_TYPE_STRING:
 		is_new = false;
 		last_prop = HP_WMI_PROPERTY_CURRENT_READING;
@@ -631,6 +637,10 @@ static int check_numeric_sensor_wobj(const union acpi_object *wobj,
 	for (i = 0; i < elem_count && prop <= last_prop; i++, prop++) {
 		type = elements[i].type;
 		valid_type = hp_wmi_property_map[prop];
+		if (type == ACPI_TYPE_BUFFER &&
+		    is_raw_wmi_string(elements[i].buffer.pointer,
+				      elements[i].buffer.length))
+			type = ACPI_TYPE_STRING;
 		if (type != valid_type)
 			return -EINVAL;
 
@@ -651,6 +661,10 @@ static int check_numeric_sensor_wobj(const union acpi_object *wobj,
 			/* PossibleStates[0] has already been type-checked. */
 			for (j = 0; i + 1 < elem_count && j + 1 < count; j++) {
 				type = elements[++i].type;
+				if (type == ACPI_TYPE_BUFFER &&
+				    is_raw_wmi_string(elements[i].buffer.pointer,
+						      elements[i].buffer.length))
+					type = ACPI_TYPE_STRING;
 				if (type != valid_type)
 					return -EINVAL;
 			}
-- 
2.53.0

