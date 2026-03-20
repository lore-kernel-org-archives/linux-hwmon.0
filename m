Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518AF398905
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Mar 2026 10:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774004384; cv=none; b=ce68vNFiI+XuWh/ev1AwvAB97kVCKrbq6DuMd/mSdHCjOyRt5W1I7FMNRUdaUTvrs4Er0hH2+A352MU2euXqfYlTgfM3WDd73JKhBDjdLjslWQgQdkzn2v947v1SxUxQOPb8hebUzXoOx7sP++ieIpPJiMuAKKm7AFp5iG6vXao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774004384; c=relaxed/simple;
	bh=pNNd3yDLO8AaMISPXCG2rf2X2lK823quU5OuYZsLynw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rxr4utc9HKiGcgNq/xxz7OkwdpPOIfl8d1RG4/KBZ47lPw3Mr3TBbxjTrJ+mLRFExPlP77gTxvV0HQH3X4d6gF7cNlayHsuKRYsmdTe3xDRdE3kq43hd7h7F44f+mGdF6xaSvRgF8jGocQ8wSvWUhEQ9OyHU1uh4FsVnVGcUHvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i5p0lzwM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i5p0lzwM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774004376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/9pGQPTg7QlYXRfZtWboLf1fefc5y2P3cHKkI2n6Tmw=;
	b=i5p0lzwMhuhfaWBQmg02UFPgk7NcxoBs4Nv8zkniSgycfeIX0KO17Tu3CSqu4RuFp+qHa7
	QW6DG1w7IIFVOTUy5IGpG9RGvCtzeooof/Q6+aIh4eokEGLj+EwWQ4Q6C/sN0C3TClabq6
	6SLCvkj6+u/ByrpONKvwPGX6KWP6LLg=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-561-5geZmHNxMgOGLW27tXzMHw-1; Fri,
 20 Mar 2026 06:59:31 -0400
X-MC-Unique: 5geZmHNxMgOGLW27tXzMHw-1
X-Mimecast-MFC-AGG-ID: 5geZmHNxMgOGLW27tXzMHw_1774004369
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 70B43195608B;
	Fri, 20 Mar 2026 10:59:29 +0000 (UTC)
Received: from p16v.redhat.com (unknown [10.45.225.20])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DC7261955F21;
	Fri, 20 Mar 2026 10:59:25 +0000 (UTC)
From: Ivan Vecera <ivecera@redhat.com>
To: netdev@vger.kernel.org
Cc: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jiri Pirko <jiri@resnulli.us>,
	Prathosh Satish <Prathosh.Satish@microchip.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Michal Schmidt <mschmidt@redhat.com>,
	Petr Oros <poros@redhat.com>,
	Simon Horman <horms@kernel.org>
Subject: [PATCH net-next 2/3] dpll: zl3073x: add input reference frequency measurement
Date: Fri, 20 Mar 2026 11:59:14 +0100
Message-ID: <20260320105915.149068-3-ivecera@redhat.com>
In-Reply-To: <20260320105915.149068-1-ivecera@redhat.com>
References: <20260320105915.149068-1-ivecera@redhat.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Extract common measurement latch logic from zl3073x_ref_ffo_update()
into a new zl3073x_ref_freq_meas_latch() helper and add
zl3073x_ref_freq_meas_update() that uses it to latch and read absolute
input reference frequencies in Hz.

Add meas_freq field to struct zl3073x_ref and the corresponding
zl3073x_ref_meas_freq_get() accessor. The measured frequencies are
updated periodically alongside the existing FFO measurements.

Signed-off-by: Ivan Vecera <ivecera@redhat.com>
---
 drivers/dpll/zl3073x/core.c | 80 +++++++++++++++++++++++++++++++------
 drivers/dpll/zl3073x/ref.h  | 14 +++++++
 2 files changed, 81 insertions(+), 13 deletions(-)

diff --git a/drivers/dpll/zl3073x/core.c b/drivers/dpll/zl3073x/core.c
index dcea98c31d694..67e65f8e7e7d4 100644
--- a/drivers/dpll/zl3073x/core.c
+++ b/drivers/dpll/zl3073x/core.c
@@ -633,22 +633,21 @@ int zl3073x_ref_phase_offsets_update(struct zl3073x_dev *zldev, int channel)
 }
 
 /**
- * zl3073x_ref_ffo_update - update reference fractional frequency offsets
+ * zl3073x_ref_freq_meas_latch - latch reference frequency measurements
  * @zldev: pointer to zl3073x_dev structure
+ * @type: measurement type (ZL_REF_FREQ_MEAS_CTRL_*)
  *
- * The function asks device to update fractional frequency offsets latch
- * registers the latest measured values, reads and stores them into
+ * The function waits for the previous measurement to finish, selects all
+ * references and requests a new measurement of the given type.
  *
  * Return: 0 on success, <0 on error
  */
 static int
-zl3073x_ref_ffo_update(struct zl3073x_dev *zldev)
+zl3073x_ref_freq_meas_latch(struct zl3073x_dev *zldev, u8 type)
 {
-	int i, rc;
+	int rc;
 
-	/* Per datasheet we have to wait for 'ref_freq_meas_ctrl' to be zero
-	 * to ensure that the measured data are coherent.
-	 */
+	/* Wait for previous measurement to finish */
 	rc = zl3073x_poll_zero_u8(zldev, ZL_REG_REF_FREQ_MEAS_CTRL,
 				  ZL_REF_FREQ_MEAS_CTRL);
 	if (rc)
@@ -664,15 +663,63 @@ zl3073x_ref_ffo_update(struct zl3073x_dev *zldev)
 	if (rc)
 		return rc;
 
-	/* Request frequency offset measurement */
-	rc = zl3073x_write_u8(zldev, ZL_REG_REF_FREQ_MEAS_CTRL,
-			      ZL_REF_FREQ_MEAS_CTRL_REF_FREQ_OFF);
+	/* Request measurement */
+	rc = zl3073x_write_u8(zldev, ZL_REG_REF_FREQ_MEAS_CTRL, type);
 	if (rc)
 		return rc;
 
 	/* Wait for finish */
-	rc = zl3073x_poll_zero_u8(zldev, ZL_REG_REF_FREQ_MEAS_CTRL,
-				  ZL_REF_FREQ_MEAS_CTRL);
+	return zl3073x_poll_zero_u8(zldev, ZL_REG_REF_FREQ_MEAS_CTRL,
+				    ZL_REF_FREQ_MEAS_CTRL);
+}
+
+/**
+ * zl3073x_ref_freq_meas_update - update measured input reference frequencies
+ * @zldev: pointer to zl3073x_dev structure
+ *
+ * The function asks device to latch measured input reference frequencies
+ * and stores the results in the ref state.
+ *
+ * Return: 0 on success, <0 on error
+ */
+static int
+zl3073x_ref_freq_meas_update(struct zl3073x_dev *zldev)
+{
+	int i, rc;
+
+	rc = zl3073x_ref_freq_meas_latch(zldev, ZL_REF_FREQ_MEAS_CTRL_REF_FREQ);
+	if (rc)
+		return rc;
+
+	/* Read measured frequencies in Hz (unsigned 32-bit, LSB = 1 Hz) */
+	for (i = 0; i < ZL3073X_NUM_REFS; i++) {
+		u32 value;
+
+		rc = zl3073x_read_u32(zldev, ZL_REG_REF_FREQ(i), &value);
+		if (rc)
+			return rc;
+
+		zldev->ref[i].meas_freq = value;
+	}
+
+	return 0;
+}
+
+/**
+ * zl3073x_ref_ffo_update - update reference fractional frequency offsets
+ * @zldev: pointer to zl3073x_dev structure
+ *
+ * The function asks device to update fractional frequency offsets latch
+ * registers the latest measured values, reads and stores them into
+ *
+ * Return: 0 on success, <0 on error
+ */
+static int
+zl3073x_ref_ffo_update(struct zl3073x_dev *zldev)
+{
+	int i, rc;
+
+	rc = zl3073x_ref_freq_meas_latch(zldev, ZL_REF_FREQ_MEAS_CTRL_REF_FREQ_OFF);
 	if (rc)
 		return rc;
 
@@ -715,6 +762,13 @@ zl3073x_dev_periodic_work(struct kthread_work *work)
 		dev_warn(zldev->dev, "Failed to update phase offsets: %pe\n",
 			 ERR_PTR(rc));
 
+	/* Update measured input reference frequencies */
+	rc = zl3073x_ref_freq_meas_update(zldev);
+	if (rc)
+		dev_warn(zldev->dev,
+			 "Failed to update measured frequencies: %pe\n",
+			 ERR_PTR(rc));
+
 	/* Update references' fractional frequency offsets */
 	rc = zl3073x_ref_ffo_update(zldev);
 	if (rc)
diff --git a/drivers/dpll/zl3073x/ref.h b/drivers/dpll/zl3073x/ref.h
index 09fab97a71d7e..55e80e4f08734 100644
--- a/drivers/dpll/zl3073x/ref.h
+++ b/drivers/dpll/zl3073x/ref.h
@@ -23,6 +23,7 @@ struct zl3073x_dev;
  * @sync_ctrl: reference sync control
  * @config: reference config
  * @ffo: current fractional frequency offset
+ * @meas_freq: measured input frequency in Hz
  * @mon_status: reference monitor status
  */
 struct zl3073x_ref {
@@ -40,6 +41,7 @@ struct zl3073x_ref {
 	);
 	struct_group(stat, /* Status */
 		s64	ffo;
+		u32	meas_freq;
 		u8	mon_status;
 	);
 };
@@ -68,6 +70,18 @@ zl3073x_ref_ffo_get(const struct zl3073x_ref *ref)
 	return ref->ffo;
 }
 
+/**
+ * zl3073x_ref_meas_freq_get - get measured input frequency
+ * @ref: pointer to ref state
+ *
+ * Return: measured input frequency in Hz
+ */
+static inline u32
+zl3073x_ref_meas_freq_get(const struct zl3073x_ref *ref)
+{
+	return ref->meas_freq;
+}
+
 /**
  * zl3073x_ref_freq_get - get given input reference frequency
  * @ref: pointer to ref state
-- 
2.52.0

