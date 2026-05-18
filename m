Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997572C187
	for <linux-hwmon@vger.kernel.org>; Mon, 18 May 2026 18:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779129687; cv=none; b=lFJWoTSCw5unQGuAqybPNFWlM75IAASrt+YS36ZdERiHxZ8KgdWDzt12jDqRRM/5VFfKJAZae/tKVEGHLbOWydPCsa7mriFsjBHXx7+5gOZ/9gdSc7s1aKAP6gqxx4TgbyG0oSyhjC2ozqvHxKGRKImQBX60PrVlEXMP6vrOpeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779129687; c=relaxed/simple;
	bh=Bt3my+6l00h9cgScvXgngonjEUgxY/cU8mMorKuK7Cg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XgGfvT5K4lPQ/XdknTB/vUmsf9tLhAgc6ThdtI/zLs8/O3vF5NdIVNaIGxP/ltD5G9GrRuynRP59LCSLG0o7reQl8wxIBgI/ByYYSxbOqfuIA+AAI6itBHHU/1Is4jOksdunkWWL5Hs288Z9bEF1cm5JILLIjLPaJh0BGF9Nzwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m3ahKnax; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m3ahKnax"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-453903ee4adso83308f8f.3
        for <linux-hwmon@vger.kernel.org>; Mon, 18 May 2026 11:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779129684; x=1779734484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f8+wQM4a4tsMzXZ7biCKDr40TVU55tRrbtX6KIaXn24=;
        b=m3ahKnaxaW1Ou8SvREKiHiQ4UNGReS5iZBkWTeovQ66QE9Poyyx3zYwc2C4XrG7k86
         U8/i6uOdicL96UWoDgGr+ReQxxvRMPYW+5KkclmSqWsaS1IeoOYbeBJXW8kfo6LeG1WM
         hhzI3pnGs8L67zdyxveQDp4Vj+WogXAhWAO00tOyRm7q9y9LTov1DRHOwtPUNwwb4Gwe
         BEkPKygmL4S2WzB9XMbb50NvKEJ1Ygvy9tWru6xL65w44vI9QpJOsxL/nMdFArzHrH32
         OFYyacVT8WYzQ5v5bjvb1km+1+1NWBNDXpE4bLIjbUmkCOTkZxmE4EqPBkbYJTaAkTsE
         mjug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779129684; x=1779734484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f8+wQM4a4tsMzXZ7biCKDr40TVU55tRrbtX6KIaXn24=;
        b=pcu5q5SB3H3BZ+YI8XGjmwGiZNvRsudbfH8Y5BwIZ6qNDutQntx1k0XZXr+6Ox0SGM
         3lJs2+IrZpbotIpVR/dKx0X7uHatOxN0jPeoPwMDJTSyoOGpYovinZbrc+Tyc0M1DYwA
         fNkisGLVXqA/89IpJT5GvTVKhsetO83aH7ubqhUCxUlXg0Ha+NTrq1kWh+7QUJrft1px
         eUlzv/lb4gBE82FT8UOTaqeQ17pu4LR/QT0NHPKvXICRDOsIuLVN6yaGmAzUqfV9MUnO
         k2GdXoAlRJ9lmYOUT3Oitkr142/nRL3z7Cp6VSLvn0Tu/BUnEbYr5ybiulKL3UcG1vOf
         NwUg==
X-Forwarded-Encrypted: i=1; AFNElJ8ttW6GrYmn7IJjWApdJSt2JqesIbm8ql3Xbu64u5zO76S+kf9t5wjbIWemMRemrmRwROBgFoJGx6g82A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQyzSFbaUtf5PVL2rot0zGWcBuOfZGHVX4YwiSQpeCfFNsdGmC
	FTtddF366mRIN3PTMa1mitiX2n4pbhWMYH68qQ7RlXz0XalE5fzDP0X+
X-Gm-Gg: Acq92OGed/h0QbnWKbx2CBmrsE6P3HjDg0Jb5tWuU0ioMR9S8iWVvcT7Vkj/s1E3e/l
	oSV0PMryYCcGKDSndrXtsWSgIV8G2SEQBQ97Axoqfx+3fk7efI7R+r430BhjkDfJGKVeNd1DPfC
	pUeEe00hnPLkFZGQOxuAo7gBkArszxQO6Z32o4ZPGIXYZpYtjOh5fT3mrgNZmmMtBo5uxEbHpY6
	G7gtKiSSZSsTPUlG+DiVkB+WtjX7iEoRLIqvn14SlM/LH5MOr+9u/KR9A+z4SKdiZJPV7FfJORk
	bWZ+fLutB879yr8adQQoZR1GglMFflSTwzlomUobwL2L4wcB0NHbXmsREthdzW+AvgKVUtyaOf8
	rjTGpsDNHW0wziX1hcHJ8IOiT4njkzLxbk1toPmbXRWtskmiNfSA0IxFvOdXdPIhh32ARsqEz7B
	tVpkVxMq8=
X-Received: by 2002:adf:f784:0:b0:45e:7997:8b82 with SMTP id ffacd0b85a97d-45e79978bfbmr9017983f8f.16.1779129684055;
        Mon, 18 May 2026 11:41:24 -0700 (PDT)
Received: from localhost ([2603:c027:c000:3cde::f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768c4fsm39305594f8f.8.2026.05.18.11.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 11:41:23 -0700 (PDT)
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
Subject: [PATCH v2 1/2] scsi: mpt3sas: add IO Unit Page 7 config accessor
Date: Mon, 18 May 2026 20:41:08 +0200
Message-ID: <20260518184109.770185-2-sautier.louis@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518184109.770185-1-sautier.louis@gmail.com>
References: <20260518184109.770185-1-sautier.louis@gmail.com>
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

