Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31EA392C5F
	for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 21:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778622439; cv=none; b=ml9qyTPudxsdCmO5KkK47YBxzNoYZDWdovKEuYKvJCPnUJPw1GI0EXWgIexJ5KN9Sbu4r9TWIg8+EnRTi3HrJhjyYAdRmgDyfHxyDs7hUmSf4I0s4BBULtfGm+K8H/nQUkEfWEzdq6LHDVeT2panXYe6LlLMQLBuXnHuH300UWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778622439; c=relaxed/simple;
	bh=Bt3my+6l00h9cgScvXgngonjEUgxY/cU8mMorKuK7Cg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C0ZxuwCfQc1xsEYouLA97E2Z8kDeob3lDmBfc1CSGF2q3BUG6iPJNW06rfDPcfCDdAhcReJzr19Co0MVjjNJDiu1Rb9DtRRh9C2+jZaT/+7gujZLVz74zqFPS7xBH7rPOIL3wCzCY01C8C/lXPSfYRph1n5pTGgcQ7ZOpDKPXcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BhdiPeF2; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BhdiPeF2"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39393c1b5aaso53940021fa.3
        for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 14:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778622436; x=1779227236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f8+wQM4a4tsMzXZ7biCKDr40TVU55tRrbtX6KIaXn24=;
        b=BhdiPeF2H+LUvuhsPGvfre25Y+cOAjfuFMmZU7XuTZvqjKff+rD8CPGi9Iq+J1THSA
         H/lIvKssHhfMug326aaemTeip7YJAPrG49nRCAoYrq34i+7j049pW6pqyKXzE2/HHB3L
         0JnrdmtyZn/TtviCdXHZ7Dv6kOdHptnvDbf6x/78mKld1ZVXyEBh3nSvxW7wtWMMbcsq
         DSDso8i6fiBjR4+XLj7y+Wozt/v6bt0UbQjr/7dr37NpsfZ5RbOzDiaAeOBd5izdyBWA
         NU4hLQJkNdCZJyEpene2ZpksUT5mWaKMgT8vSTRabntTY1U+CDDf+QbwDk2WQ7boiRFd
         uBeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778622436; x=1779227236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f8+wQM4a4tsMzXZ7biCKDr40TVU55tRrbtX6KIaXn24=;
        b=jQeon8BVpaGWRj2r0+ohOAllYwvZRqTEJRdfFfzAhVl9FcuXFsUyO7qGK7AaTLZs2j
         QjwgpzSUZeyFCoJ9j8avgZGAAfYdkqIbemrYhA4G8zURWG60q4cbHj9ywdXLkgdlI2t+
         fXe4G4Sauv/59T4Nb7Bgq/aJ9WOD05SgMZSwzMuCE0eKUeXNThzDSQvg3UvzV9XxPkdp
         s+ntCA9QiYF0i3WCVCUssSD+CJ+os4ZbXmFp5waUqmXDDsV7nh86gFk4Wp0XJxMDkJq2
         d96R1r61nBg1yu8plo1Yvl+1jaXAnpaw4i5eGUC1PrZmeh/QR/2r10sE2pIP9Lp9Jfa+
         aWGA==
X-Forwarded-Encrypted: i=1; AFNElJ+73UCV3ctsKsiy9OTmPsEBFzOoyscUXG9rHrOycHOdVOhPB5sLdokjdFRw9dYYHh8q0gElv+y2PUZ7uQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwI67tomrYLNFPiGAlETUYjik9mZwyPbrCZOsar9PzMG+rIbDZZ
	91H+73HX4bA9RVsWCVdMK/dArtCpF4YzBROuiV+Uqq89rK6VfHpqxcEG
X-Gm-Gg: Acq92OEW0VBdBLef0Wy3sgSsUlvf0dwZHvop48BwSoVnmjxS5qkSQFyTuy8X2liBPTH
	rxupbfzBUylUmYSgHzMYhj8naNUhLV+8yVu/MK0NcArcQjU6OQrSYg2EUm3amrGTDGDAsntGg60
	dfb1XAXYC1Hf1iBCTJg5tF2D2BFvRxejYquQMmgJr4BOgLG15tIn7EzdnUj5zEppozVzBAi6M6H
	NMGrDaFX9plGVi4IcGROukYKkESFq1uGXxyBm0tTQv6GkXCNKR25SWr8kwkDVZ4kHZ/1Wl+YMjU
	4EyT22dwrg+c5a5PCNGj3zqC9C7qtxF2ybH6iw+XwzE3npKT7dz5UTkLzRn+ukivdjNLV+qhRmx
	t0HUQsmzG1SoLcN+2IV7VzIojP7YeF7LPkoNwcCCXvK0bzK3k1yzRQmmVggyLLExtt3wyV+Kp3T
	x0cVWwhSPj825Z37BKTF5+5NuS2Ys=
X-Received: by 2002:a2e:be06:0:b0:394:44cc:c944 with SMTP id 38308e7fff4ca-3944b727769mr2238831fa.27.1778622435870;
        Tue, 12 May 2026 14:47:15 -0700 (PDT)
Received: from localhost ([2001:863:361:c304:f117:a539:6ce3:fb03])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f6144071sm34373081fa.32.2026.05.12.14.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 14:47:15 -0700 (PDT)
From: Louis Sautier <sautier.louis@gmail.com>
To: "Martin K. Petersen" <martin.petersen@oracle.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Sathya Prakash <sathya.prakash@broadcom.com>,
	Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
	Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
	Ranjan Kumar <ranjan.kumar@broadcom.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	MPT-FusionLinux.pdl@broadcom.com,
	linux-scsi@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] scsi: mpt3sas: add IO Unit Page 7 config accessor
Date: Tue, 12 May 2026 23:47:02 +0200
Message-ID: <20260512214703.655633-2-sautier.louis@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260512214703.655633-1-sautier.louis@gmail.com>
References: <20260512214703.655633-1-sautier.louis@gmail.com>
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

