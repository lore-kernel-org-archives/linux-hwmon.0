Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BB533A6FE;
	Sun,  8 Mar 2026 20:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773000184; cv=none; b=by78Zh0cHslimr70OO4uOn6jnNiMAW61cf6QjUNUat6Qz5Edoq4DfsVtyEX74pxhGqt4ff3PL5Ehjt+KnjpSVUMllBpWp34adoU+QFTrdcggWmwuP0vNPeRyNLiAA3qV5MvfsdDi1Kh+6uHzCYrbzvTKrccFtnngcWvb3tSruf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773000184; c=relaxed/simple;
	bh=/eGwD4fhg8LTJnCVSRrW0gkeOJMBW8xCMHNlNZwM9Oc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qrQ9kRAJuwkfcEgYgYrUb8/4nblQjQ8Yi+G7YKwm97Lul666vNub84QKxJ1Zgi/ulmO9JwfWWpq8oNoCbTYl4LxzhyMPkOQTuPKWo+RTfFcJAAms7KV4Z/11oShsc/qWALEs00PYIHihBz+GPsqWtcSw1v6zxxFpHoDLM99ysro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=COLvMSCp; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="COLvMSCp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1773000161; x=1773604961; i=w_armin@gmx.de;
	bh=X0M69zc2AGnZp/wYLbrO9ROF+xDzTXntMd5s3xSM94k=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=COLvMSCpMRE7gGpdge4oKNZ1bb8BER7G9Qvj/8aGyyr2S4LfF5YjZh5OT1WKNgPv
	 8R/w7Q/PCoc8i4iPbyrt/+0ztziwy4m888g4Wxt8J9wMOuR+Whmb7lC4ikOqQft4s
	 CO1OqLhTJ0quuHfHIB7xyK/GoZml0Grd2WnwCS0eTXVsPIyHljArukXFxPojvOQLa
	 1RO4odEH2GVblozEu1zYkeM3DEroO1B4aJYQeEPf64MFXWTSTAC2KPWETks1x3hl0
	 T+SyifMr6btER1OTtVqgdD5CMyMA91pN1xA9T+3AnefdSrzuBFsxeXklRokN7O+Kj
	 yVbVxSlnNSqa2Tt03A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1My32L-1vist41v4B-014XAB; Sun, 08
 Mar 2026 21:02:41 +0100
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
Subject: [PATCH v2 8/9] platform/wmi: Make sysfs attributes const
Date: Sun,  8 Mar 2026 21:01:54 +0100
Message-Id: <20260308200155.118950-9-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260308200155.118950-1-W_Armin@gmx.de>
References: <20260308200155.118950-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Bupesr35kr82y5IdEcm6w3msXNtkzJnj4aTG3wmJ23BY9xR2RYF
 Iu3nz+3YFRzDhV15xvaAzbtTeurcRUgXOWKsi+EkHBCDoOu/i/hwYz60kPk7LH8cYrZOjcT
 Y/jNOdgEaQCXu/IU2tps8rWq7m/vYnQ1IkzPkoBieiuUVI1fhT9NeEOuMC9mazMhiNlj51F
 zz+lvCPAmAJKOeV4AkBsA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/4/uP7pG3VM=;N+gGpGunFfLZhyMDITenTJAFAGG
 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
 XOGXmabR6RaESe3Yv4abYjzvG0dCV

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

