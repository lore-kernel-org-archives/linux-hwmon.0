Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F69D30F81A;
	Fri,  5 Jun 2026 21:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780693219; cv=none; b=CrJY6FBRu/bPX4FkJk6NXnk4WACivapDcwx23lhC4vff7HoKyL1vbYaX5YplYC31arQLvVZD0HPTBnG7P9/DJLDxlU3lWYNRXn+tNlhJKSTYje526C/qcVwEoGJInWLvWQ5bLOpfjCgMiiKZzjpZE3lmKoaACqh6lofG8FOPcHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780693219; c=relaxed/simple;
	bh=sfhyhAr6Z1fCYegaDc1uMzq6JQrVDvMEKBIFYmzuNlo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QrIli6p1wIYwIyDhF1p02hNuK6vwcY4vmlRxbb8Oag5L0ANEri1jcrV68XKEIsZ4Mf5VM0zD/nSxKNcQh1epXwZVF9TPHjdzmMRPN6UNqGe0EM5908HTd1RqvhVVbsO1rr6IN83+pX9Nla4dMirWnVMw+SIXgItXJpPpMtW6+Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=e/0KxA0u; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="e/0KxA0u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1780693192; x=1781297992; i=w_armin@gmx.de;
	bh=rlTaw9B3AUeB15wt1JCDtmJ4GEA7e5Z/Mss93u9vxvs=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=e/0KxA0uOMiJM7pAMWo8x+Tha91qI3VGMOnsS1v7GLAiBrIcJYCBr27zdXDF+Zc2
	 XoANaiqHMskgqBVv5IJ5KmGbec2NhJU3B3UQkEISiKpp68CL0p5kXunaLyHGY0DzH
	 tdbEd9SeUIymZM7a0Ck/Wu/AKpR1BmGot0BAdPiCMAj/Du6LvkdZgT/3yzqoxgEqt
	 uCUrwdlHjehMaYCzr+i9t1AvtVUMQwCXpK4qgMnIygHSJiwPLhfupD9heSAUcfQ/s
	 tcPRMv19zu7ILnl22tW5At0m5a4bkhlqXkCIUn4EYeakpycMK2V3eg1qCXZWzP9eH
	 453/PcXN49zHrgRRTw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MkHQh-1wy1a509If-00oSjI; Fri, 05
 Jun 2026 22:59:52 +0200
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
Subject: [PATCH v5 8/9] platform/wmi: Make sysfs attributes const
Date: Fri,  5 Jun 2026 22:59:36 +0200
Message-Id: <20260605205937.530897-9-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260605205937.530897-1-W_Armin@gmx.de>
References: <20260605205937.530897-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KKa9WSaxJjPCnN9SJAYurVkGZDjTOZ/bOlY6i88P1YOz6k/ZEEL
 ZTWeD7GK9ElK+uERSSi2sp+tyvefNfi7XgvRQtViLVdx4j51YpDVwurlljrQ8UVwKE6F9f4
 VSnWkVSbNSn9V+lWHxSoxS3yJJQ6KFT+9vycPQ9Zho/NMlmTfnJVcEeEPvZzq0jvHMhbVUv
 KIaEh1p56X3Rrjck18dFg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:VonALydp2b0=;Rc6d52uZQkoJPOsVGeZ20qAln2x
 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

The sysfs core supports const attributes. Use this to mark all
sysfs attributes as const so that they can be placed into read-only
memory for better security.

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

