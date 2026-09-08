Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1492A59D623
	for <linux-hwmon@vger.kernel.org>; Tue,  8 Sep 2026 22:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788908266; cv=none; b=YAYOYMZtUM39LVg7ZS0JhZ1wPKMxC81XU1gtMDnvybmhU/QgcALA0RqW4S3r0PkUKaTG1mUTPWcHxtBW4paTuvKFKu7TH5DGhJUjASz/Hax8lqgqV0lHYDbpnF7y2DwLkDjgwp3Qaal139Fkh3atGBZizTkqbCJvLay6aQpmr5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788908266; c=relaxed/simple;
	bh=VylVE97urOnGo1fKhA1IwM8dNjVc6rVPycHxhapEvGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fut3+Q0qMo3vBbM+HnpuIyUU1vgAI/VEquLjSNpnu9EZ+kiw1BenEwJQ7c7pKzduvgMSO0eb/nQKVBZ07MUnadtuCF1G5erV/xpSWbzG/0N1tXDFDGK4kQtPSgB1eSSKZ+g2FCtI6WNZjQbph6mEyy/k4VHscf91SkNkNOqSs4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cvhXOtxr; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cvhXOtxr"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-39b2ad862bdso5707303a91.2
        for <linux-hwmon@vger.kernel.org>; Tue, 08 Sep 2026 15:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788908263; x=1789513063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5mP6wFrKPhYjd/5KHULwyWUdonzv0xy3jN9195/5g2U=;
        b=cvhXOtxrodHOE0zH9bB1Tol7SWh74fVXuX4HyR44DEEwbphbokhKf+OvQFtVpYlaEG
         v/jFeCV1PtEQZMeHl81rJDDZeHfv978A/b/4MA/4q20tCB0yhtQWxQM3SQkuAgde0Jp3
         24SHgaYyJIFzeS0la6n9sbZxx2k+QEzixCxzaYMz1zAIxrnm1wmX8jlpjFepdmAVHTFP
         oiwAuDpeyQZpWyKvpAj3BkXBDfq5C8QVKLsrLGNyZ5kw4Zbgi+9jLxrJ6x24wMQpN4qL
         zqLO9+WdYVvueJpMMFTntqQ0J0oont17n8fyTzwlo5g7vu2V9XhUL9eCCGe5C/mYJj8i
         dKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788908263; x=1789513063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5mP6wFrKPhYjd/5KHULwyWUdonzv0xy3jN9195/5g2U=;
        b=bvGHvuhDZtS2+LgjggueQGuRLKvUhLVokJDVVIA3qXoLT6A3Hm4AOO195bIvPTfTMI
         suVE12+IRwju9kkg4tsVAGqNFa4nBw/xFdyZmwQqxt+dSaiyBEfXbmPUTOfP7henCNip
         uDG0nRez9K7KozP0i/vob+8clIQvGQyB+VHrw0vJgxUNCn2iotQA9IQYEbPXAGoyCAOB
         +VMvflVRH6Z+VyiPPBEfAGbYYpDDnIPvoRBnpzjlcE76hpnJIWH7I2wYgAiEzcibSiix
         tjVWh8Sxd3sHC/iZPLVzsiN/bK6hbkVGCfsBoIm0Gd2SCJPhIdqSvoQwNCkIDRVuSNNJ
         RcRA==
X-Forwarded-Encrypted: i=1; AKwUvBy2T5TEoHuLPGU8rOJwPi69lJZMJhXio8c53wvSdtqzcrNLYGKNrowJs2ehYGj492nF5qybnWIDiDKNGA==@vger.kernel.org
X-Gm-Message-State: AFuF++k70J2Ns6EwUd6WEEcDnOGY6PSv/HUj7R4eraaBz6LRV0qEwITy
	/s0Rkpka65+XV4yzRAWJN3xOGb4t8L7+Upl01Vi7uJDkl7XUSUJZFJZYf3Gtnw==
X-Gm-Gg: AYBFou3XkmSuB4TaZilkncAJPMtDVQbJxF0DSgDmAWcSZKjf3PE/frdsKX5qM/0JOg/
	5wPii1JFqJmdUMLnUlb3+rpct5dweoDz4QfnAAftJ4FGzDc71rH+CTScYVDI5ki8GJksEtfAd9r
	zcZkIvY9xRN7XyQxY+RPEs+t+V4tJ4d7vyB+7xbPsnLhvWvEdkBDWr0fIjbxrEJ0F45QMGmjvpX
	lqKleFvAjRFgzmKBmRT3etx6zG2tvc+EPmmD91PPfjcluuMEMQAqzQJuPsaFdmUD8oWdrloapVJ
	cGdUXGjHnyifRtNYX9mGopHuLF/FOpk8MQb9tjnUYbcrJzOMVFgvHW81n2Csgd9qVeHNHQKm1Eb
	Lw2O/BqfwgoerGCl80lb7cLmi5p5okCFDDiQ288zn5+wuWU8CdDFVkgW487b47cxF0cFnpp04im
	ldXRmNlkfxGE4+fxg3rSldG3wvhhLwMjxyL/L8EFwwbCRPCMx6aGBOyvQeZEgiLEo4BSg=
X-Received: by 2002:a17:90b:5790:b0:398:9bd5:4910 with SMTP id 98e67ed59e1d1-39b2624f0ffmr45595682a91.23.1788908263245;
        Tue, 08 Sep 2026 15:57:43 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::6:91c1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a62be87sm32982165eec.6.2026.09.08.15.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 15:57:42 -0700 (PDT)
From: Zinc Lim <limzhineng2@gmail.com>
To: alexanderduyck@fb.com,
	kuba@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	linux@roeck-us.net,
	horms@kernel.org,
	mohsin.bashr@gmail.com
Cc: kernel-team@meta.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	zinclim@meta.com,
	limzhineng2@gmail.com
Subject: [PATCH net-next v3 2/6] eth: fbnic: expose all hwmon attributes unconditionally as read-only
Date: Tue,  8 Sep 2026 15:57:33 -0700
Message-ID: <20260908225737.3034403-3-limzhineng2@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908225737.3034403-1-limzhineng2@gmail.com>
References: <20260908225737.3034403-1-limzhineng2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All fbnic hwmon attributes are read-only and always present, so
fbnic_hwmon_is_visible() can simply return 0444 for everything
instead of matching on the sensor type and attribute. This also
prepares for the threshold and alarm attributes added in the
following patches: they are exposed unconditionally and reads
return attribute values.

Signed-off-by: Zinc Lim <limzhineng2@gmail.com>
---
 drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
index 6c8c66ab86c1..38bb26cb8e6c 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
@@ -20,12 +20,7 @@ static umode_t fbnic_hwmon_is_visible(const void *drvdata,
 				      enum hwmon_sensor_types type,
 				      u32 attr, int channel)
 {
-	if (type == hwmon_temp && attr == hwmon_temp_input)
-		return 0444;
-	if (type == hwmon_in && attr == hwmon_in_input)
-		return 0444;
-
-	return 0;
+	return 0444;
 }
 
 static int fbnic_hwmon_sensor_read(struct fbnic_dev *fbd, int id, long *val)
-- 
2.53.0-Meta

