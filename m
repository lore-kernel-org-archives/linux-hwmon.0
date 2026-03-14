Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323611A275;
	Sat, 14 Mar 2026 17:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773510797; cv=none; b=WWcoT5ItxGFM5jxK/82UXEmfZhL0gQ52zvS8ZF0tHS9jqS7M7keNc9X7FbqqX568FklQZ+7TOtGEddfB4+cKjOqSIlb8MpqAlNVoSN33KNP3KTJmi72ig+2mva7WCnJnG9HHZTM74EvMbA1MnoOk5xTIupR1WZ2bkbyjL6sG7mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773510797; c=relaxed/simple;
	bh=/eGwD4fhg8LTJnCVSRrW0gkeOJMBW8xCMHNlNZwM9Oc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OT6QUufMbxbs8fH89w1fTelGBoW1+avA3zyXC8Gh+jwl8I0cum/Emv5SFtsQ9qpYN8xbsq8/RXi1yeZl6wwGzU+1C63GPH9U71YpMwqmIE4M0LOWX7dZgoBVQeK8lMnCQ1dKrXALgkl5y/QvlNRfzqjoaP3AL7t4wyovuwLwf5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=OzOq3hgR; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="OzOq3hgR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1773510794; x=1774115594; i=w_armin@gmx.de;
	bh=X0M69zc2AGnZp/wYLbrO9ROF+xDzTXntMd5s3xSM94k=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=OzOq3hgR2e4KO8BlfE6p4HM80NLvPwcjzhp56TdPm9VIggSgqgx+8Rjou0uhQvJI
	 3Dt+XvBxZvV5rx1KI7TBAY2FbhvdWUY7sST99MZvHdDvSx+IWOCQo/lUsLpy430UE
	 EBn4ruU6LvEVzSr/2Q2qXuMGVY1GsQyFwP14cjDTkMjqzyESKKX7+uysiIIQgIP4f
	 heAW1eksINhpyAqB+iuNwa/dRalI7A0uAXIK5/Hs0yuBQrq3XuNWATl2n5NxHrP64
	 3GBfoWW1Brt26rlG+LtpQ6L3dHQcYSuFAuLdOa+LXJrgLBW0sz/Dtmi89Pu+kwMu6
	 UR5CxZ3dFZ/F4U+kHQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N5VHM-1vZLW7414U-016gJ4; Sat, 14
 Mar 2026 18:53:14 +0100
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
Subject: [PATCH v3 8/9] platform/wmi: Make sysfs attributes const
Date: Sat, 14 Mar 2026 18:52:48 +0100
Message-Id: <20260314175249.16040-9-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260314175249.16040-1-W_Armin@gmx.de>
References: <20260314175249.16040-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Gy1O+c5MFsh/4p8f0RnweWUdWOxAFrICgeVpNJA577lQZjF98JB
 A0tM0kVJ6fm2h9JogTcjsGLXAD1sDRjVfvHA0RtoyaJeN+RntM5U77YoBDRuYqZSAZKex4n
 RAaIhJ+p8i0t8leUA4JWnpIWcAAXHSxPIWYa34w0RJE48acxU9fmj0eRbxinExar17Kpxwe
 hCujlIFyx1eYI1joTwj6A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/WGLbBBs4L8=;cGENNMSNCx5PmInOYKksDJ8Jin9
 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

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

