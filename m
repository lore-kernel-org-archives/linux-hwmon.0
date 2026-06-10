Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667814A3408;
	Wed, 10 Jun 2026 20:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781123751; cv=none; b=oJH9++FbuWMLGX/+ZsNK1FrKmvfVH3s+j7qJ7M+0pR1qweRFEsGG8U+eKUuRr7rVFUsnTIkiuRC7ysIgBrVXG8DjyeOG4DahdXS3AnSCjqkHxW5ItgQayzcOQb0IRN4EbNmlXukWNUARoZoHf83nPkLkL1XTXYSbGn2KECMVAiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781123751; c=relaxed/simple;
	bh=d/IOYNxIlo1LWsz7aRqw83vBTwWl+u8A9zvyqzGvu6c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n16jaPCN7AiYVKMBBVCYknx1QSO3tvxg6QQ6Zh72RFDnAM0j0sTlkdmZn8RfWFUdjDasJSOm2lqU4wVYgKQAcP115N4ghgWj44vMVpdBBQCX8ws08Hd28xLo1GoesFdhslKmvQw4AhNQ7a0UZJcaR++DJWrm5tmRRNk5FExEkKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=NjXsPRSn; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="NjXsPRSn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1781123722; x=1781728522; i=w_armin@gmx.de;
	bh=y6l6/Ju0nABAtnlCYb81NgYQM4++QeKmo8eRBorIrW8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=NjXsPRSnItlJhQxAtdQSdEYFQux3GEUz4jd2z4ypvp0sF1WTcdkycv9ByQRthXLI
	 E+6JQjhCDkBqO9RS51TAItTX53+VZiZbod0JIZiW/oHIEw2b2uAGeu1l57lUsvzFJ
	 60BnpiugI+Xf94KZhgqJKjBPT00jYp4NON5YQHXfNUh/3CpoCrFprqr/GIiDvvw+W
	 KwFYxx3nxFTutMm0kxccPHGnfj1rbD2iulZM1bfyXZmHpFdYp7OEJypQBXhb5lqPe
	 kHYrW6+NJx6ZO97HIpMepOEfw7xO2ADYchVpyuUt118z8RZVip0Am3GWE36xLpEGh
	 3eAKEiFfq4YgYyMx2w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MqJmF-1x2Oks4AVf-00gBk8; Wed, 10
 Jun 2026 22:35:22 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: Dell.Client.Kernel@dell.com,
	pali@kernel.org,
	mjg59@srcf.ucam.org
Cc: soyer@irl.hu,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	mario.limonciello@amd.com
Subject: [PATCH v6 8/9] platform/wmi: Make sysfs attributes const
Date: Wed, 10 Jun 2026 22:34:52 +0200
Message-Id: <20260610203453.816254-9-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260610203453.816254-1-W_Armin@gmx.de>
References: <20260610203453.816254-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:J4etl/HkjOLof/T4EoJimiVyRX621s8E1V6B/FFb/PLYzbuh5yH
 yGheo31brMNpm9qw1M+AVZMBpEBkhFWqOHgqrJMSKGXUYZIQd1AS49aHBaZbL9mUIB1fdbA
 PgWZztQNIsn/zefx6P248jCbob1BsM4Sw+78GV4aORT0iZvyeSC4rVuCEbTjVhcKDhS3sYP
 dWnhBgBa3fkwxh3k84jqQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lX3+Sl5CVTY=;tM9It95qvWc/wxTZNsgv+WH24OG
 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
 A8q71q08vYv4pGASfQvW9cqCUXw=

The sysfs core supports const attributes. Use this to mark all
sysfs attributes as const so that they can be placed into read-only
memory for better security.

Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/wmi/core.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/wmi/core.c b/drivers/platform/wmi/core.c
index 0782ebc33c00..529825dcfbfe 100644
=2D-- a/drivers/platform/wmi/core.c
+++ b/drivers/platform/wmi/core.c
@@ -858,7 +858,8 @@ static ssize_t modalias_show(struct device *dev, struc=
t device_attribute *attr,
=20
 	return sysfs_emit(buf, "wmi:%pUL\n", &wblock->gblock.guid);
 }
-static DEVICE_ATTR_RO(modalias);
+
+static const DEVICE_ATTR_RO(modalias);
=20
 static ssize_t guid_show(struct device *dev, struct device_attribute *att=
r,
 			 char *buf)
@@ -867,7 +868,8 @@ static ssize_t guid_show(struct device *dev, struct de=
vice_attribute *attr,
=20
 	return sysfs_emit(buf, "%pUL\n", &wblock->gblock.guid);
 }
-static DEVICE_ATTR_RO(guid);
+
+static const DEVICE_ATTR_RO(guid);
=20
 static ssize_t instance_count_show(struct device *dev,
 				   struct device_attribute *attr, char *buf)
@@ -876,7 +878,8 @@ static ssize_t instance_count_show(struct device *dev,
=20
 	return sysfs_emit(buf, "%d\n", (int)wblock->gblock.instance_count);
 }
-static DEVICE_ATTR_RO(instance_count);
+
+static const DEVICE_ATTR_RO(instance_count);
=20
 static ssize_t expensive_show(struct device *dev,
 			      struct device_attribute *attr, char *buf)
@@ -886,9 +889,10 @@ static ssize_t expensive_show(struct device *dev,
 	return sysfs_emit(buf, "%d\n",
 			  (wblock->gblock.flags & ACPI_WMI_EXPENSIVE) !=3D 0);
 }
-static DEVICE_ATTR_RO(expensive);
=20
-static struct attribute *wmi_attrs[] =3D {
+static const DEVICE_ATTR_RO(expensive);
+
+static const struct attribute * const wmi_attrs[] =3D {
 	&dev_attr_modalias.attr,
 	&dev_attr_guid.attr,
 	&dev_attr_instance_count.attr,
@@ -904,9 +908,10 @@ static ssize_t notify_id_show(struct device *dev, str=
uct device_attribute *attr,
=20
 	return sysfs_emit(buf, "%02X\n", (unsigned int)wblock->gblock.notify_id)=
;
 }
-static DEVICE_ATTR_RO(notify_id);
=20
-static struct attribute *wmi_event_attrs[] =3D {
+static const DEVICE_ATTR_RO(notify_id);
+
+static const struct attribute * const wmi_event_attrs[] =3D {
 	&dev_attr_notify_id.attr,
 	NULL
 };
@@ -920,7 +925,8 @@ static ssize_t object_id_show(struct device *dev, stru=
ct device_attribute *attr,
 	return sysfs_emit(buf, "%c%c\n", wblock->gblock.object_id[0],
 			  wblock->gblock.object_id[1]);
 }
-static DEVICE_ATTR_RO(object_id);
+
+static const DEVICE_ATTR_RO(object_id);
=20
 static ssize_t setable_show(struct device *dev, struct device_attribute *=
attr,
 			    char *buf)
@@ -929,16 +935,17 @@ static ssize_t setable_show(struct device *dev, stru=
ct device_attribute *attr,
=20
 	return sysfs_emit(buf, "%d\n", (int)wdev->setable);
 }
-static DEVICE_ATTR_RO(setable);
=20
-static struct attribute *wmi_data_attrs[] =3D {
+static const DEVICE_ATTR_RO(setable);
+
+static const struct attribute * const wmi_data_attrs[] =3D {
 	&dev_attr_object_id.attr,
 	&dev_attr_setable.attr,
 	NULL
 };
 ATTRIBUTE_GROUPS(wmi_data);
=20
-static struct attribute *wmi_method_attrs[] =3D {
+static const struct attribute * const wmi_method_attrs[] =3D {
 	&dev_attr_object_id.attr,
 	NULL
 };
=2D-=20
2.39.5

