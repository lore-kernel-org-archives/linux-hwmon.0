Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25C547DD70
	for <linux-hwmon@vger.kernel.org>; Tue,  9 Jun 2026 16:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781023521; cv=none; b=ISlDQUMG3UO62tnf5VijDamHPFNdtDag8AeDpISIRc5cSJUNwI6yA4QG4okedXKuJsEBrrif4WujMCmF1CTN/b/n/t49ZbYqTPneXYzzTaKiYQo4ruVnGsIu2DEsq0b+TXTMZRg9LhR6Ed+pMV2QgRe9oirIMfCQ2Wkd384HX88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781023521; c=relaxed/simple;
	bh=Bt3my+6l00h9cgScvXgngonjEUgxY/cU8mMorKuK7Cg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VvfT8D79GLqkhAnCcnP+dKcRpjQ4p6NZXTUnbbN8vHWEnlm1hj+/JgDUm9d7EQS/By7ox/o/30twewA00rsIz2HpxPsmy0+uro7e+0oU7eUlYF82O3tB6lN4mvNdNPQyY2N3/JYPwK8NVIA3dTxJ2hcQmz61XIiMyT0aOpjw6W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ipv7P6bs; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ipv7P6bs"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45eeea039ebso3060778f8f.1
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Jun 2026 09:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781023518; x=1781628318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f8+wQM4a4tsMzXZ7biCKDr40TVU55tRrbtX6KIaXn24=;
        b=ipv7P6bsCl1k3+tGBJNpnueRBwvupjARxEUtiQqpaaCWycSmApY4JFYk0d1xNHP6Fq
         6foz0HThZbLOAIRMc62+5DPGWvlzGEdfvoaBvWmlbSSD9ZJO4UXUykpy1GzOtTNr0sCv
         AMQXlpw0eXQeTHwKwy2DeU4hrofJSzjcQMy1KPZeK55JZR6fOK4Q0d9RecPp4ftEgwwp
         qQv8I2yF7SdM8ZMmEgC4aD9nLrLInTehHw1B/JEC5tIZp5bDZ89fJ1vH4C5XErFtiWFy
         xOcXjpivC+D2+HROGCylR/t5cyyP8RvQtjwrArLRpMp64XqiIyeTB3fjjMusOiK3ECNi
         jgTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781023518; x=1781628318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f8+wQM4a4tsMzXZ7biCKDr40TVU55tRrbtX6KIaXn24=;
        b=Fbc7lShZlY5ytu4GdhkEOgyuxFf+hw4Ez1Zxg+EfmQg1cvA10SNLeuu3oPGPsVLLKH
         PeK1qXDVNgWmfW3I91eJO+gfQcAzk9OmY+adjbjO9vpOno+Xc5FASIkVAdFTmRPhFm8v
         NUKpTbfTctFzgxMAW/BHx04Lq4xoSEeMrqnwhc88jxnJHEKfFbhdpQSJv2P0pT4AL9pC
         d6i6v3MXEHxSJxr6e7Ham+AnbwkILXX4vwh4jSRytLlfEMIcH9KJkAXOIAgWIIRz81P+
         ekxlCeiv6WyFx5t/S8vR/HzKR0SagE7u4OEt01gMTZpOEUPmYxIdToDSn290qoX1FZ6i
         0cmA==
X-Forwarded-Encrypted: i=1; AFNElJ+5YhspOQoDVJrcjNqB9x0YHM6oauR9OHzqEFHmVTNABNE5ricpT+Qyb/RhRwiwcnIKbyHm6vqiH9uSgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUsZMxRp3ajt1+tOig2kPbOamUFlF+TpVFUth8kSixqq3fp+bm
	D9OUOkyxRBvesb2V5cXgxnudiE1NZwos0nRdD0pS1D6Uucaf48N8Ntey
X-Gm-Gg: Acq92OF9bPvaezHfI2Sp38Qif1E7eOtrZ9XGo5uS/NmjAcZ6aNrlDsk04UqH0VAepk+
	mZNtVesqLTCV/UUoKApa21U5km1HbYeyO+NYgjlR5UDVBQ0Jac4ytrtPiJuIVn5+JgyZBDI5ptV
	Ls5ES9cL+gqHrcOpzFjGOftesjc7xMtTrGsEbG8i1s2yH9c3SAx7UeE8WehvBjLD1eEBz4AYL4G
	gCQ/xsADY3vyVjr2hPvTA51MieJWbZKEVZVWd0VtmauIPoAM/dDRt+kLpJZd730Xj7R91eqmtFA
	sh2chnSeVDkvw2HFyq+BafWFc60XUwDPA+D1miGRqjdQ/gMe15+Sdb/S7qw0TbR3SragIybHDzY
	IB6+bbWqKQxoPPM8bHc9GxbMHaLHpeciIcE4DV0+vKjHHYcPr46wnGFZ6+fjLVdtAiGg0Gcfici
	xGnP0b9c1AS1jkqtqz
X-Received: by 2002:a5d:4a4e:0:b0:452:75ca:3fab with SMTP id ffacd0b85a97d-4603063a3c1mr19456027f8f.38.1781023518076;
        Tue, 09 Jun 2026 09:45:18 -0700 (PDT)
Received: from localhost ([2603:c027:c000:3cde::f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcbe3sm59351635f8f.8.2026.06.09.09.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:45:16 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 RESEND 1/2] scsi: mpt3sas: add IO Unit Page 7 config accessor
Date: Tue,  9 Jun 2026 18:44:22 +0200
Message-ID: <20260609164423.2829699-2-sautier.louis@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609164423.2829699-1-sautier.louis@gmail.com>
References: <20260609164423.2829699-1-sautier.louis@gmail.com>
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
---
 drivers/scsi/mpt3sas/mpt3sas_base.h   |  2 ++
 drivers/scsi/mpt3sas/mpt3sas_config.c | 36 +++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/drivers/scsi/mpt3sas/mpt3sas_base.h b/drivers/scsi/mpt3sas/mpt3sas_base.h
index d4597d058705..c655742d0dde 100644
--- a/drivers/scsi/mpt3sas/mpt3sas_base.h
+++ b/drivers/scsi/mpt3sas/mpt3sas_base.h
@@ -1904,6 +1904,8 @@ int mpt3sas_config_get_iounit_pg3(struct MPT3SAS_ADAPTER *ioc,
 	Mpi2ConfigReply_t *mpi_reply, Mpi2IOUnitPage3_t *config_page, u16 sz);
 int mpt3sas_config_set_iounit_pg1(struct MPT3SAS_ADAPTER *ioc, Mpi2ConfigReply_t
 	*mpi_reply, Mpi2IOUnitPage1_t *config_page);
+int mpt3sas_config_get_iounit_pg7(struct MPT3SAS_ADAPTER *ioc,
+	Mpi2ConfigReply_t *mpi_reply, Mpi2IOUnitPage7_t *config_page);
 int mpt3sas_config_get_iounit_pg8(struct MPT3SAS_ADAPTER *ioc, Mpi2ConfigReply_t
 	*mpi_reply, Mpi2IOUnitPage8_t *config_page);
 int mpt3sas_config_get_sas_iounit_pg1(struct MPT3SAS_ADAPTER *ioc,
diff --git a/drivers/scsi/mpt3sas/mpt3sas_config.c b/drivers/scsi/mpt3sas/mpt3sas_config.c
index 45ac853e1289..ef07825046bc 100644
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
+int
+mpt3sas_config_get_iounit_pg7(struct MPT3SAS_ADAPTER *ioc,
+	Mpi2ConfigReply_t *mpi_reply, Mpi2IOUnitPage7_t *config_page)
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
+	    MPT3_CONFIG_PAGE_DEFAULT_TIMEOUT, NULL, 0);
+	if (r)
+		goto out;
+
+	mpi_request.Action = MPI2_CONFIG_ACTION_PAGE_READ_CURRENT;
+	r = _config_request(ioc, &mpi_request, mpi_reply,
+	    MPT3_CONFIG_PAGE_DEFAULT_TIMEOUT, config_page,
+	    sizeof(*config_page));
+ out:
+	return r;
+}
+
 /**
  * mpt3sas_config_get_iounit_pg8 - obtain iounit page 8
  * @ioc: per adapter object
-- 
2.54.0

