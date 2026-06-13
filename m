Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97080335BA8
	for <linux-hwmon@vger.kernel.org>; Sat, 13 Jun 2026 02:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781318342; cv=none; b=DxxSrkUUOyjTSrXMrDvveVYvXQ0dBn+6w4OtaiZSPJ6BWIBTuoBWtRQhxQmAGLUvMwa3GLwjo83AyErXGNg5LmRR2cIHEb/uycWNEUNDs9Z4GcaIUkJNoGLSGmTtFZOPxkmYjb958+dapq0zhNFx+RvY6X05mYw4gwlAzzFhXPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781318342; c=relaxed/simple;
	bh=KHwt4VywKXahV6WokSspiyABJUFGu96lEtBUDy+TEgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NwnTMRf4rRlQHo5C8CaZDM/M6xA6AFZKWHk/6kfE9Vs0kJA/MuTvUbOZRDnOWOuL0JpgXsHYLrfpEjX/kKPrNV9qXd3W4vHfVqRtCiA8xPThk11MCNUfidoiLwcITPVI/4OVhMdQ9Qf0RjnVtCKXqi6Fq7u2xrNvt/VFDuVPLKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mNxLf5yT; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mNxLf5yT"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso13503245e9.1
        for <linux-hwmon@vger.kernel.org>; Fri, 12 Jun 2026 19:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781318340; x=1781923140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XF2BPxT6RGXOvylZIStDuHxnCtiMXDzVdoPv3lbFrwE=;
        b=mNxLf5yTqYMs7RN7dVu66sIKvO60OzOTaD2us+UoP81YMfDAn9tYYkFZjePmdzZtS2
         Z6mS2RvgtUKTMlOpMM5yDewMR+vZ75WnYU/sBWlfvvAZZ4URQVFk6hhzmtsk/EER/dHa
         /+ftHiCpw3xdRkCPNRrYXCCsjkks4TBBp5pnHYOXJ8nvJ5xhAfKheszMY0evZ8184xdu
         r0yN6aonfX8HvHulGpvu8i9L+5gDP/50qVM8WgAs4/5pM7EZ6wTWE2po9eXrMD+/jOH4
         YVJW4V5RCCJ7hA3HcUDJbkR9+tS7yusyFI3YYPba68to57c2G0TRuvC3UagRgmihFsMx
         +Ukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781318340; x=1781923140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XF2BPxT6RGXOvylZIStDuHxnCtiMXDzVdoPv3lbFrwE=;
        b=L1xkktopXlLU7jrrp/Ns7x49CMp3kXMeOSY5sy9sBsVEZkd0sYvBLwqO2yN8lbFhn/
         1rvJRk4uaLS3yzj3sXvG0ajCqPM2vrZqCo7DBle3tNB9JgUvhEt2eNiZe2txOsM5/A43
         4wUe0cxxnyem4H5Fv4kWnnUSjTzbY8NqsyoUZCJmh9WZkDzt4TiVrbQmcVUhL0R/+R1o
         0mEvIRFIlYPAfv6dClmoJigh1qeMkX/bzBw5CWgkcBsleoZVqPDModM88u1ef8XhEaRk
         CS94gziHnsia8NEo+NZEkIxtu2GZrILqI9DSCFrzeqj3g9d+EDBDrQkyxt3GKQ73VKgM
         3Wtg==
X-Forwarded-Encrypted: i=1; AFNElJ9cwgVQQvkqShIfplPHGEVID/GvpA8GcGtvEEEzF4wYED2by91WALgIjQb/6DE6YA4jKCGZAyoOrN5D1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRfIc2HhycF8VTWYO44QP8i7dM348Dj1Mgq4VMiRcRzbiPrgT4
	UusSZsCYUHcXdikTj0SbDC9LxbldxXF8eOt72r16hUuDSESyrwgFlT3g
X-Gm-Gg: Acq92OGjE6r6g3WT9PuoeyqgiiCXLHxp4YwK5ZDRn898rQZuji4C9gSsvNDs4KDlW99
	24sw5o4Ukgl1e4v8w4e0HhGDEYe8Px3PoUjoPj4+q22cMNtI41lHs49sYhNPWCiqTidxvkKTO0s
	7khLJRDrP1DUjToid8ArTPzGocRuB2SfJEyBk2T0Fn15iBnVtNe0wtfdYnu9CdawA2v7HaaCcPH
	RhdcI3wPc/yHVkQa4HmlJM2HMpG+wXuyQz4aQ0Pf9GpmQOHLGPyqBz3Sm5ympubrnQs/s21pcTZ
	hl2PMaFKeViEhO4pJ0OGMkf4z2bo3UbVKvyXCV1Fe+myDpwfDuyNXwk0LFTppU1OyikktH2pvvv
	AS7iQuVE4JvKBa3N09l1wQaIpde7usXJBaQFwU2IsaZ9BdbSs2kDFubf8uewAU9tLYQ5yue40wx
	xtKZRMXlg=
X-Received: by 2002:a5d:5d13:0:b0:460:e2e:6e2b with SMTP id ffacd0b85a97d-46074a8a1b7mr2065810f8f.20.1781318339849;
        Fri, 12 Jun 2026 19:38:59 -0700 (PDT)
Received: from localhost ([2603:c027:c000:3cde::f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2c473bsm11468595f8f.28.2026.06.12.19.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 19:38:59 -0700 (PDT)
From: Louis Sautier <sautier.louis@gmail.com>
To: Sathya Prakash <sathya.prakash@broadcom.com>,
	Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
	Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
	Ranjan Kumar <ranjan.kumar@broadcom.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	MPT-FusionLinux.pdl@broadcom.com,
	linux-scsi@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Damien Le Moal <dlemoal@kernel.org>
Subject: [PATCH v4 1/2] scsi: mpt3sas: add IO Unit Page 7 config accessor
Date: Sat, 13 Jun 2026 04:38:32 +0200
Message-ID: <20260613023833.3163507-2-sautier.louis@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260613023833.3163507-1-sautier.louis@gmail.com>
References: <20260613023833.3163507-1-sautier.louis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add mpt3sas_config_get_iounit_pg7(), mirroring the existing iounit
page accessors. Used by the hwmon driver added in the following patch
to read the IOC and board temperatures.

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Louis Sautier <sautier.louis@gmail.com>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 drivers/scsi/mpt3sas/mpt3sas_base.h   |  3 +++
 drivers/scsi/mpt3sas/mpt3sas_config.c | 36 +++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/drivers/scsi/mpt3sas/mpt3sas_base.h b/drivers/scsi/mpt3sas/mpt3sas_base.h
index d4597d058705..fe21b0425047 100644
--- a/drivers/scsi/mpt3sas/mpt3sas_base.h
+++ b/drivers/scsi/mpt3sas/mpt3sas_base.h
@@ -1904,6 +1904,9 @@ int mpt3sas_config_get_iounit_pg3(struct MPT3SAS_ADAPTER *ioc,
 	Mpi2ConfigReply_t *mpi_reply, Mpi2IOUnitPage3_t *config_page, u16 sz);
 int mpt3sas_config_set_iounit_pg1(struct MPT3SAS_ADAPTER *ioc, Mpi2ConfigReply_t
 	*mpi_reply, Mpi2IOUnitPage1_t *config_page);
+int mpt3sas_config_get_iounit_pg7(struct MPT3SAS_ADAPTER *ioc,
+				  Mpi2ConfigReply_t *mpi_reply,
+				  Mpi2IOUnitPage7_t *config_page);
 int mpt3sas_config_get_iounit_pg8(struct MPT3SAS_ADAPTER *ioc, Mpi2ConfigReply_t
 	*mpi_reply, Mpi2IOUnitPage8_t *config_page);
 int mpt3sas_config_get_sas_iounit_pg1(struct MPT3SAS_ADAPTER *ioc,
diff --git a/drivers/scsi/mpt3sas/mpt3sas_config.c b/drivers/scsi/mpt3sas/mpt3sas_config.c
index 45ac853e1289..b0d5ef893600 100644
--- a/drivers/scsi/mpt3sas/mpt3sas_config.c
+++ b/drivers/scsi/mpt3sas/mpt3sas_config.c
@@ -991,6 +991,42 @@ mpt3sas_config_get_iounit_pg3(struct MPT3SAS_ADAPTER *ioc,
 	return r;
 }
 
+/**
+ * mpt3sas_config_get_iounit_pg7 - obtain iounit page 7
+ * @ioc: per adapter object
+ * @mpi_reply: reply mf payload returned from firmware
+ * @config_page: contents of the config page
+ * Context: sleep.
+ *
+ * Return: 0 for success, non-zero for failure.
+ */
+int mpt3sas_config_get_iounit_pg7(struct MPT3SAS_ADAPTER *ioc,
+				  Mpi2ConfigReply_t *mpi_reply,
+				  Mpi2IOUnitPage7_t *config_page)
+{
+	Mpi2ConfigRequest_t mpi_request;
+	int r;
+
+	memset(&mpi_request, 0, sizeof(Mpi2ConfigRequest_t));
+	mpi_request.Function = MPI2_FUNCTION_CONFIG;
+	mpi_request.Action = MPI2_CONFIG_ACTION_PAGE_HEADER;
+	mpi_request.Header.PageType = MPI2_CONFIG_PAGETYPE_IO_UNIT;
+	mpi_request.Header.PageNumber = 7;
+	mpi_request.Header.PageVersion = MPI2_IOUNITPAGE7_PAGEVERSION;
+	ioc->build_zero_len_sge_mpi(ioc, &mpi_request.PageBufferSGE);
+	r = _config_request(ioc, &mpi_request, mpi_reply,
+			    MPT3_CONFIG_PAGE_DEFAULT_TIMEOUT, NULL, 0);
+	if (r)
+		goto out;
+
+	mpi_request.Action = MPI2_CONFIG_ACTION_PAGE_READ_CURRENT;
+	r = _config_request(ioc, &mpi_request, mpi_reply,
+			    MPT3_CONFIG_PAGE_DEFAULT_TIMEOUT,
+			    config_page, sizeof(*config_page));
+ out:
+	return r;
+}
+
 /**
  * mpt3sas_config_get_iounit_pg8 - obtain iounit page 8
  * @ioc: per adapter object
-- 
2.54.0

