Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20F378F39
	for <linux-hwmon@vger.kernel.org>; Mon,  3 Aug 2026 22:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785795384; cv=none; b=rPS5vz0YHEAx5OLINUWVb0std2Ppu2jB4bp8B0TDhwyaYgrRZndq2UEdClPiEAKM1QS4x7Q1417sRAIw6xRH6iwHOkZSOpS5xf0pn6DVYCoaL3IozszlKcWmQG7/drcchK+6qC/s4me6SF7dyNwvygUn5pGAKTpOiiVA9NN7/A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785795384; c=relaxed/simple;
	bh=zSTDonIyBsR3WqojOzXln4HA3bKn7fqzEMx8iWnncMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q1rSBcFSJ+GDIm1S1npcakXkRq3VBCzD3uK04j7jxs3AiwAYwgroz/tW9dla0DWHUZu8WZIuH/7louy6rybDtjEty5skla715L94TsPL56bbW/+UU+6Zh2Nw5eebCqUbqzvIJFHTK9oEQ+7+8UZit2e8zYCHeSIJjhoK/CeNcQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z2VGZe+E; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z2VGZe+E"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so2932995a91.0
        for <linux-hwmon@vger.kernel.org>; Mon, 03 Aug 2026 15:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785795382; x=1786400182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BPAQpOydhVH6LbG4fSXhvyUlk2qXWOQA9jkrLqZQMCI=;
        b=Z2VGZe+EXmWb/UElNyHc7clTzFJ4klD4DWiShD4RN6VAFyUBGMB/AD0WLHp3xGBESk
         l7eO3R8kDiMtsahbG0B6OHj7YmqxW1PzEe3UlsTfpRDWt7lQJTIPqI90FJXhriDzRhsJ
         oyg2fZdeDBZsc3cewehF6c7725fZ8T1PcxyxOXOJPrkK9ftEJdviHIOC+2lhBlJRP3WI
         ReMlM3ofSNnMhpeBbiVREZp9Jc+kZwa088sPRI3d6qenOW7IYNzGcUcUKRzYr+gOIoqu
         GBgH5GR00jMeqUrAJ94J0qD/t1bfJebZBYd0n1RqvKrE1sNm91vnXjpKVEzmFIp3qNw1
         RGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785795382; x=1786400182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BPAQpOydhVH6LbG4fSXhvyUlk2qXWOQA9jkrLqZQMCI=;
        b=kP1jhSfwj/dG4taNIgN3HMeSndTIeaEPsgZKOm61s2e/zvSolr0iglfyAgrv2Ky2Nc
         1G0gGCp0t4XSvqYsy4642w4gbMoDCqzYK3y/HaNJT+hNBnpqrqW6ta/4OFyb8ZHzH1c1
         bvbbrhRJcP/TazOiseVUr189vhMiiyizRKsqpwneWW3B2dQdQX06A124pEm0r2/5U4jB
         k5tIfi1qL+bERWBBQTMwXlwuTeAOkg1EZToibv2KWzt4XDIWnbOXuHzVQQAeE2cwFMhk
         WaJrNsHikmf0P1gOc4mtzf4AEdmNyCSa+JXtaQfEv7qyDlqUCMyl3mC71BEl9UZKmNWT
         UQ9A==
X-Forwarded-Encrypted: i=1; AHgh+RpqONEXiqE1hmo49KtyMNx+8c+NovFgGbJDlmYgA6TL1RPcwoKPoV2EiuWROgQ9NbVym4nVota1mYNxxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz66YBt1Is7T39HU+9D5dlRiJB29ws7FkshmGhyzGOg2ZVnUn6b
	eH48d8Lr1kaEDNYmyOZnWR6q05cByjrTuaPMZLpXz3lyVq0wL2eB2E+F
X-Gm-Gg: AR+sD13J3STPTaCoY+G/I0Pfh4ikFuDrmbRl3ePYCcZY7EQTZJF1EOM5YK9Q0G31Bv6
	f/nISGNy2scDk5TByYtp1XO41uePOigf9JIk7oVetWYtqbqr8Wy1ypBWyw9zKDM7/Gv6uYemq/o
	uehnpHgXjg1TSudfLka7ZzNDtjS2fPELszI7CMSoSvLmuYzGiCNNN7x2gbBp4l9XG5GOQyboMmr
	sytfia7YSf/HE5iYd8HQqtFqXO5jRREmL8oWylnJ/OEcSW+5Z+1HEmlOTQev33Uc0suouNvj26a
	9NQueKpbxAcYvJ7dvTNLclsm1VPtuLWJegafC1ZfbVMymX8GXwtgdhTUDgFW66tniAvE9oXdSoJ
	eLsv9AVycqW3zyNK+7cHs+mE4AQxiZgIw/rDXdnsAX78Mj6Vh1T9aOCT2FFJpFCNhfSXtoCkUL4
	XtLfhRZ0kNabOjE7OqZ815qeJ7w3OmO/+xwp2FWsUBXn47ckoGqTEssqXV3zHpYzC618On1vcZ8
	9fmcbtck799zuLmmaobg7CqBUTx06ld4x4lyY47gw==
X-Received: by 2002:a17:90b:2b86:b0:38f:240d:b857 with SMTP id 98e67ed59e1d1-38fbc3f7e4emr11504598a91.2.1785795382006;
        Mon, 03 Aug 2026 15:16:22 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab1334cfsm38685666c88.1.2026.08.03.15.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 15:16:21 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: lkml@antheas.dev
Cc: W_Armin@gmx.de,
	corbet@lwn.net,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	jdelvare@suse.com,
	kuurtb@gmail.com,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	"Derek J. Clark" <derekjohn.clark@gmail.com>
Subject: [PATCH 2/6] platform/x86: msi-wmi-platform: fix: Remove unused err
Date: Mon,  3 Aug 2026 15:16:10 -0700
Message-ID: <20260803221614.59324-3-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803221614.59324-1-derekjohn.clark@gmail.com>
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20260803221614.59324-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

msi_wmi_platform_profile_setup() declares int err and leaves it
unintitialized, then returns PTR_ERR_OR_ZERO. Remove the unused
variable.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/msi-wmi-platform.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/x86/msi-wmi-platform.c
index 33acd448f674..2439b4f0001b 100644
--- a/drivers/platform/x86/msi-wmi-platform.c
+++ b/drivers/platform/x86/msi-wmi-platform.c
@@ -1422,16 +1422,12 @@ static int msi_wmi_platform_init(struct msi_wmi_platform_data *data)
 
 static int msi_wmi_platform_profile_setup(struct msi_wmi_platform_data *data)
 {
-	int err;
-
 	if (!data->quirks->shift_mode)
 		return 0;
 
 	data->ppdev = devm_platform_profile_register(
 		&data->wdev->dev, "msi-wmi-platform", data,
 		&msi_wmi_platform_profile_ops);
-	if (err)
-		return err;
 
 	return PTR_ERR_OR_ZERO(data->ppdev);
 }
-- 
2.55.0

