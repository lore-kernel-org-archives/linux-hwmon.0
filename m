Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBBD54654;
	Thu, 21 May 2026 03:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779335558; cv=none; b=u5AxWliB65zgqZiGIxt5WbZLfuKHwisMNFMy3IKaP0xy3vxpghL1XhVEeV7JaAyvZqaDD4NlfePKv94aKuDSmsznsn6/nQWOEH9ATtBkM520/QxScSAfb6iVByI8qnTU9BHfbpVLMlgVZuEMoeAA4sI5GdcNpiRVlSbTamHWb64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779335558; c=relaxed/simple;
	bh=clSYjA84FoZWd7KFdJFfFsdv3M6kzsaMCSMj1IiVF0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vE3klRJ7dwg1504cp4FmcC4RqGr4zVr2n0Cy6UsXcfvinOKOlBLnQDDd2cYUTscZZw77enMcd8ohJ+a7FsRWDO/1r6hPi8X7lutFJg9G3urMsbIvRPPE5IfRJyW44HrTGq9BjwBTP9cuYvfwM2a8GYbCdR1CkxtCm/rEbMV4Ayw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=RX8htm3f; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="RX8htm3f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=u6
	B05ut8gcm7kTgE/pcHPOZKiVNBIkWUc0Tg3IC8aHc=; b=RX8htm3fT45SQkZIFq
	I3jsUIwrYzAo6u2Us1A23zb0puQtaxV2Vj72co2cRGV2ihqAuGTgmd5qBqEIyB3i
	VKc0pnAQ1tphMTpjY9pOskB/gxqsedilF/kvLFvrJfUmSJoSyaIrODyKY1MsL4a3
	gDDCVihQdVsYavCNjTR42UhOo=
Received: from debian.lenovo.com (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3Xx5ngQ5qPDdQCg--.18159S2;
	Thu, 21 May 2026 11:52:08 +0800 (CST)
From: Kean Ren <rh_king@163.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kean Ren <rh_king@163.com>
Subject: [PATCH v3 0/2] hwmon: (lenovo-ec-sensors): Fix EC signature validation and I/O resource management
Date: Thu, 21 May 2026 11:52:26 +0800
Message-ID: <20260521035228.533317-1-rh_king@163.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260514011411.4167069-1-rh_king@163.com>
References: <20260514011411.4167069-1-rh_king@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3Xx5ngQ5qPDdQCg--.18159S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XrW8JF4DZrW5CrW7GF13CFg_yoWDGwcE9F
	WFka4xXry8t3W3tFsrAr4ayFWfKF4UWF1rJrs8tay7AwnxJrsxGr40y393Xr1vvFWYkFn3
	Xrn8XFWxAw1SvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRR89N5UUUUU==
X-CM-SenderInfo: 5ukbyxlqj6il2tof0z/xtbC+wiYR2oOgWiMHgAA3z

Hi Guenter,

Thank you for your patient review.
This is v3 of the lenovo-ec-sensors fix series.

Changes from v2:

- Corrected bug description and Remove unnecessary {}.
- Reproduce patch 0002 based 0001 changed.

Patch 1 converts manual request_region()/release_region() calls to
devm_request_region(), eliminating a double-release on the probe error
path and a release-after-use window on module exit.

Patch 2 fixes the EC "MCHP" signature check that used && instead of ||,
which caused the validation to accept a non-Microchip EC if any single
byte of the expected 4-byte signature happened to match.

Both patches apply cleanly against v7.1-rc3 and pass checkpatch with
0 errors, 0 warnings.

Kean Ren (2):
  hwmon: (lenovo-ec-sensors): Convert to  devm_request_region()
  hwmon: (lenovo-ec-sensors): Fix EC "MCHP" signature  validation logic

 drivers/hwmon/lenovo-ec-sensors.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

-- 
2.53.0

