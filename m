Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C36A221F39;
	Sun,  8 Mar 2026 00:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772929563; cv=none; b=Uz8BmgfiAfWHfBYD0i0M+2EThDzX9m8xiQFP0XYhxXAkPahmHsA01uYRRnwvdWEuBYI88eOQcjkdT6D6R4i9PglWWoGZOk2Dzh0vBKNzOHsGXyGyhkxJpcx07FYwuBfHwzXlKlBUqtuUc69jyomIL0PZpX3BJRI3U0zPpFOQJQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772929563; c=relaxed/simple;
	bh=/eGwD4fhg8LTJnCVSRrW0gkeOJMBW8xCMHNlNZwM9Oc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mCkRv/ppscgaW1psfSmwoHGL/+mh2ldM8u0ebq67YQCGPCVhoQ/hqksLGB/JhWHFICftn03vZxskpZPPbM0GrURzUXvchDWghjtFSR3qJ1HjtLL+pLgywwKj4G0jexe8AhQ5Hp1sg3aCZpmEfKG1ZFXTDbiGYxe4A5j8gHtYMEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=IBptAiEd; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="IBptAiEd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1772929537; x=1773534337; i=w_armin@gmx.de;
	bh=X0M69zc2AGnZp/wYLbrO9ROF+xDzTXntMd5s3xSM94k=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=IBptAiEdvq6Uj5T8GOE9M1i2M42F8Q9EsuPrmw7bqPSHbp5UUr9yAqoQy2bfNvOq
	 AmUuCOidM5oEzFYBgvNLNdTUpnjHvHYpsnJ0aySb+B6h3qPD2Lvty74Je7gv2OhTu
	 K9xsVjCnZNtH2WernZUusYEgqWCFRsHopNj2SbKo20hjYTwVJ2nBCGDMGgO/I/tp/
	 sD8Fa3WcYxKo+f9TcUvuClWj7sU7tpyU9cgGYQvjDXmYM/Ppf5TM832p3NrClpmXD
	 BmTZEjtJewGH7jB4Z4JK0hRhWD7u8p8eLZWrW8DbuukIelMmYKkJ3VnjEgl/xn7N0
	 IZOxY3/oC/tjxaSe7w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MS3il-1w6Qe22CLr-00M5Eb; Sun, 08
 Mar 2026 01:25:37 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: Dell.Client.Kernel@dell.com,
	pali@kernel.org,
	mjg59@srcf.ucam.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org
Subject: [PATCH 8/9] platform/wmi: Make sysfs attributes const
Date: Sun,  8 Mar 2026 01:25:21 +0100
Message-Id: <20260308002522.4185-9-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260308002522.4185-1-W_Armin@gmx.de>
References: <20260308002522.4185-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AmcaDoulOsig+ql47rA6C25ddDEOKgjG3NXGsy4EVCFmhkWiQLC
 VdbBVSAq5a6oxrHrKU679L0DGy9otslOscj+Ae5H4X7GawoQ+rnOeKGbpfQWg7ySoxXOsqG
 t/KMBwcOaGEtFVh53dc9FzkmdE/dSNRFra+DNBwASYvsLSSI/c0iEbUN9Ywu/Plx7QxmctS
 9A/sCeANIWaALEGODSUlQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OFPjaLXF3MI=;WqTcPWaSnF5b+c7z258GW+ovfmB
 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
 G3a7jVPs=

The sysfs core supports const attributes. Use this to mark all
sysfs attributes as const so that they can be placed into read-only
memory for better security.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/wmi/core.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/wmi/core.c b/drivers/platform/wmi/core.c
index 082c85625878..1b5bb3410252 100644
=2D-- a/drivers/platform/wmi/core.c
+++ b/drivers/platform/wmi/core.c
@@ -812,7 +812,8 @@ static ssize_t modalias_show(struct device *dev, struc=
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
@@ -821,7 +822,8 @@ static ssize_t guid_show(struct device *dev, struct de=
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
@@ -830,7 +832,8 @@ static ssize_t instance_count_show(struct device *dev,
=20
 	return sysfs_emit(buf, "%d\n", (int)wblock->gblock.instance_count);
 }
-static DEVICE_ATTR_RO(instance_count);
+
+static const DEVICE_ATTR_RO(instance_count);
=20
 static ssize_t expensive_show(struct device *dev,
 			      struct device_attribute *attr, char *buf)
@@ -840,7 +843,8 @@ static ssize_t expensive_show(struct device *dev,
 	return sysfs_emit(buf, "%d\n",
 			  (wblock->gblock.flags & ACPI_WMI_EXPENSIVE) !=3D 0);
 }
-static DEVICE_ATTR_RO(expensive);
+
+static const DEVICE_ATTR_RO(expensive);
=20
 static ssize_t driver_override_show(struct device *dev, struct device_att=
ribute *attr,
 				    char *buf)
@@ -867,9 +871,10 @@ static ssize_t driver_override_store(struct device *d=
ev, struct device_attribute
=20
 	return count;
 }
-static DEVICE_ATTR_RW(driver_override);
=20
-static struct attribute *wmi_attrs[] =3D {
+static const DEVICE_ATTR_RW(driver_override);
+
+static const struct attribute * const wmi_attrs[] =3D {
 	&dev_attr_modalias.attr,
 	&dev_attr_guid.attr,
 	&dev_attr_instance_count.attr,
@@ -886,9 +891,10 @@ static ssize_t notify_id_show(struct device *dev, str=
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
@@ -902,7 +908,8 @@ static ssize_t object_id_show(struct device *dev, stru=
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
@@ -911,16 +918,17 @@ static ssize_t setable_show(struct device *dev, stru=
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

