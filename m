Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB19332E757
	for <linux-hwmon@vger.kernel.org>; Sun, 24 May 2026 21:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779656767; cv=none; b=Ax2D86boNVlD95Zkl5HPxNK325xmhd8N5d1d2cluK7y2IgFW0ge+nMAUUs4B6c6koOqOYGaepfkDY4l8inMcNVKE/lRCqthfBrVO4i0lw/BMwnFusjUD8uH/fu15+ZPJWcGNnFRR0TMa/KDoQ79rPUoHzM4E1euo38P7xnkRBPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779656767; c=relaxed/simple;
	bh=Bt3my+6l00h9cgScvXgngonjEUgxY/cU8mMorKuK7Cg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YWLxDrcQT0xb9B3NJkCOD1x0J5CoMi37Q358Sedcd9IIBUjmNX3yZmmV36HfdSjyERorASK9J3uhfvqEYtBlGipE8RSFjfUAQTAD2xwjTbD7HkxPQczl6+7iwDXteUX9fnHRk6mM645DKTX28ZKvPjzXEr7au5igPl7+5lD10o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eVdmu+3/; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eVdmu+3/"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48e8132c6d0so56509665e9.1
        for <linux-hwmon@vger.kernel.org>; Sun, 24 May 2026 14:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779656763; x=1780261563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f8+wQM4a4tsMzXZ7biCKDr40TVU55tRrbtX6KIaXn24=;
        b=eVdmu+3/dRcaOdCzy4MIt1RLpEdCXEf3fOvULXgm9GifoGPgKMVFk+3fU362cK4eMi
         otDAIOSDnvJ7z/AXuSpjAdv9ajflE/QNSDi45yYuXftJP/iCFCDEmj8Il7Ls9chLa6fC
         pKZCMkLmuc4SiaFsQk5QpmyvQjtKbrlYZ9Sg0fZKOzH7ysknLsv+ysoqXDHLxwc35dZo
         gO97nGHCbnrtBInNgzzd31pNvtLli04Dd/NLATn6whXJS+JPlZGzbnKltxPdsh4X3kQR
         16lneip3b5QdoV68275bihIsWO9C3G8UO2FG9Zcl5d5gvaUEDR/2qJgrFe9Go18KQiU7
         fE/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779656763; x=1780261563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f8+wQM4a4tsMzXZ7biCKDr40TVU55tRrbtX6KIaXn24=;
        b=CQ4UpVHp9kaXlAj5lCIXezV1SnkO8RivD9/dErtA7Wx3GbgD//t/NgddvX4t3v0j6E
         3quYfWsKqUhl8M5GDGCbQYgcQyjGw064PaPUEA5qz5k0YWTZzMWYl7/8iDsjV2bvApmQ
         YeG18w2KY/KarNQJlb9GIqyCaPZARXH1Mt+QDCJqLjychucSvoqa+UYzhWD719c8g8xT
         cLeaPCdgKZhqhihYbEMhCky11NElB6ETnt9Cnk7N0P5CxDmlO5lGglOR9xh0Uls4IzAr
         QxIMp+HqbznPQdmYOIkxW+OEVkYRghgV3IJ+ayyQa3zIak8UC0pYJB+jymZJLN+ECroD
         95xA==
X-Forwarded-Encrypted: i=1; AFNElJ9Ma0AXn9fLJN148PV2IBvzzeGi9CrbZ9DJfAjr8kspV3+PC6vgksdPtw86iKwqra4QcX73ivTgxXgnxw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8xo9XXHiiExTi43j2VKlG23cKu1Qn9YNy+8kpwaIO8GbgCklI
	na5X1ckx7/49VkgFZPW1edzNTcT3iXF2fkqwLljLc4lrOOmdRgVVoHrWGmQbMT37
X-Gm-Gg: Acq92OEcYFSQTD+dMlJgIK4mDVChPkdlmhGHug8Qm5aSdRNLsEk+OdMujuAgUySlQk9
	Q5LBEUFyVtOyXOS/F2EL/WpbkFVhUYzNOuoynWEPKSk/LwiS0Z8O+G5nEezhL6DrueBNT7jGmh0
	eZ9C17kVg2t2uWvAA5tCvEzMZiaDfDk0QN5V9dwnHMD6CrTQMSE1xCH/nxaPjGZx7Zod+yxFTwy
	3ngHzvd01JR/wJDZ4jRDgaWi1mWy4fXHYcB+80F9vSxxx1nr80vUCR3pgcR0PAkk5siCGgzajub
	7/lTvi5/DvONOXluEyV044AogS87ZDyXpJ3qYBwjO8raSuF648dQkXrC1+awhIKE1QyiDwtav0o
	izBzdmzInnZ/zkU1ekxs85Vo+DSKPNNucCo4/LG8dBiZmvEiJqqEHoKBeVo8whNgZByPnnB22Tq
	Ow7o33Q4DLiAgioSzAbA==
X-Received: by 2002:a05:600c:474a:b0:490:51e2:d992 with SMTP id 5b1f17b1804b1-49051e2daa6mr127785455e9.13.1779656762894;
        Sun, 24 May 2026 14:06:02 -0700 (PDT)
Received: from localhost ([2603:c027:c000:3cde::f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49059fb42dasm85170925e9.7.2026.05.24.14.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 14:06:02 -0700 (PDT)
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
Subject: [PATCH v3 1/2] scsi: mpt3sas: add IO Unit Page 7 config accessor
Date: Sun, 24 May 2026 23:05:44 +0200
Message-ID: <20260524210545.1333637-2-sautier.louis@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260524210545.1333637-1-sautier.louis@gmail.com>
References: <20260524210545.1333637-1-sautier.louis@gmail.com>
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

