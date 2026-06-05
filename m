Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826CF397E8A;
	Fri,  5 Jun 2026 18:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780683296; cv=none; b=HKAavLQCmvKpjwJJRqzHkPND+rtQ+ez3k0tMSvu0XoQ2x7B4rrGGRA+dRCbRYiQMZmQHUEGZBnQtBF+7CLZtJzaQkca8QH1/9wG3EueALH6hPiAwffNdRLg8B5mnq1mDkZ/C85QHt1djHBMKJvRK6XKFIn7t4aTe7M2l26TlDmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780683296; c=relaxed/simple;
	bh=sfhyhAr6Z1fCYegaDc1uMzq6JQrVDvMEKBIFYmzuNlo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FywLQXlgVtI45/CLhqeT+3chQUVwdtiM9LkKO8Gk465LWG+89y/M3T6m9slxy1hqiKhpEpMmdTltQk9ck2Z9pvYGksYvPRA2RRWczsVi0F/4XfSCS8K7V08tw2HbkabXVpL8duxSqjliYs4PKxACG26Mzz2izL13hSZUSlI7pkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=gcS1SrGs; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="gcS1SrGs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1780683286; x=1781288086; i=w_armin@gmx.de;
	bh=rlTaw9B3AUeB15wt1JCDtmJ4GEA7e5Z/Mss93u9vxvs=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=gcS1SrGsCxhrPMhjQkURzsq0REUj8NwJtNvFShZuLsiAX5KszXKkHQJoKQeUFT+4
	 RS1dsRwbVKCCDdoIlB9PjcsuHNJ8TcGhf2xbnP+wa734DPchvd8I4FFA8RxXUTaVZ
	 LUv6aLdjrikVzI2p+JtREG8FTtNbsPYInHs66MFBc6SqCMAlVZCivcBO1+AzKfvd7
	 +ey2X+vn4twtfomE20LtMnbVkIqB6CDnCfnu0YUN/JVi9d5+/U+7dv/r0Sg2MzIVg
	 uX4biSFHI/hlIFKXL/y2rcnsUkoTM9YEFWVMQIINxCOcv3qhdMs8G6FT1z5w65to5
	 eK4/wzSyy+oSlgcJ6Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MZTmY-1wjOzb44dK-00JAgg; Fri, 05
 Jun 2026 20:14:46 +0200
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
Subject: [PATCH v4 8/9] platform/wmi: Make sysfs attributes const
Date: Fri,  5 Jun 2026 20:14:32 +0200
Message-Id: <20260605181433.188847-9-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260605181433.188847-1-W_Armin@gmx.de>
References: <20260605181433.188847-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Yk+HdIEmEqjYwY1F2d+pcHBkMGexe34LrXtoY1U3fmzy88a10Qs
 eLNzB1yEgFcDDXtaZk0hslBaGR2WnBGYiHn/KskoSrVuJ8iaJ3HpsorNtyCzuOi4O/ArpVl
 vGjZEabV08zYI2P/CoVGQ55UNxPTD6dAhvvQkT6A8NJvyL/iCLmUOBRJ1/B2K8isTRhXVug
 05m8Qe2SAkx/+qrp9pIPQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:yUeyZq7OEi4=;Qt4U8c/LL1XQ7Fh9iYGgUnUA/Ic
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

