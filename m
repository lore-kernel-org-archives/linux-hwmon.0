Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB252D617
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 03:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783741055; cv=none; b=gV4+J9y18Vist46jTx9nEBca64Aw5rfleXX4eLL/OyzuGuMrMLXtpquvwFhWC8poZSPh4I6T1qnTp1BaQYtSBuIYXMmQt9Me7oscn0H4Ag7VpOTsFANf1WG/90x36hyEc0Ba0Lk2iHxNRIsfkvwyWUKZQHy9YGlfppYySvg+UZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783741055; c=relaxed/simple;
	bh=UL8h5yA8OtJ++aeghXVsSyAJzYYnK6nFPd/G7ZzKXe8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ci3vCDc6EtKk10px2Qdt+/fH4NR5hheW+V23AsR2gDEBzLe1AZOzNZsmFL9yPoMrewWsBZpgMBSY5DnQ1j9eutGAj9t1Tp0WKd0q0niPAqEMGj3P+4wbXbwE0gBSDQGbbTHuAaoL++Lno8H2tA/6JWVI3dLdFBocFXS4Px1LKkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-384c94c9414so1577543a91.3
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 20:37:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783741054; x=1784345854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eIzGIpmLRN3M1TgRdSi95Ht9oOEw9xopkeHZ/dEQJJQ=;
        b=qE1nYoF3pTXbRnaKtM6TpQjn77Xp6zJkbrcYu3K1kh+mHU01cSsR4IWc12//SvltBJ
         yaaGxJtDfprzYXLB9y6NxLmWap1FTtJbBaRBW+dLzVgWmWQVdiZW9cLnwQ03kqcSkOgV
         dr0mqVSvRnJ7Zt71q/XPBVB6lP446Q7QHwIrjxInM2Ta0tIHUFg2n8ygxWtoyZ7gXSPW
         msXag/QDPMl4PYJHo8Khz45qv6Hp7c+hc79Y+iQsP4gI+cZkdEZ1RsOPt2zje5Hqnlyq
         r519w1n254Fon+00fEFppbjLycs/G0TNd3WPSs0D+lHUOoztAvICQO0rblWn1XECQpgU
         5IFQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrl7j8E7fqVtAECLzTxR22KNF/g4FwiRrR4Bgl5M7tSffRPj1qYmzD57oD8N8LnSqYQANf885gXGnS8OA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtbL3sp2WdPuJOI1//NhPKFsx0cvMoAFw4QFksw6zuJFr8qyG1
	AUde19fq+HsQoF9Uuc0FojPCf2iLE1JwLmfmvbYwVI9v4gc6+t3V+1Q=
X-Gm-Gg: AfdE7ckjwF7mOY1TbcahXuLmRXBW6ZtSPdZwgv0DYglWeK/DVEk/nY20beSmGD2xJds
	Hqm21kM8W1rqKDBGuITJR8zhNMKeIZ18EDEbSd6aBfEKjh6cqiA+52F8Q6xJmRrHxegKKgl48UW
	R5QcUhxWhPJksBzX4FbfZel4No4ZbiZ2wIWAToZRnlZ/V8ucgkdTHZBSura0LZqQEpd0ih9WEQg
	CfyAEdDRGoOQYPeGBGL4/kPTp1WltCMpBGaY6H0uXMd6WBlHoSEnDcwv3VZ9P4lvIuRPokIYqFi
	ld8OWjQ0cjcsh5Yg2Yq95p6hRjFgpR9hl6kZ2UJxtECCzDS+a/hzwep6YPXNCil+4xrK2NSIVxS
	rb0IPtbGkgCEaXFKy8nsTNbKmXZv9YYfcnMztH9PlLOHVSMkkxmlq/ygRzZzzBQG23MzNRHTFDX
	Li9o/j+JK5cbYiitqmiC6TdhTENW4pL0XdENE/q9MQI+CpBH4ZkUzWSB3eq5dd1HQId1zovE1+n
	a4nzfnzLIy7L6ihWdpZjq064+IPQb/uyaih
X-Received: by 2002:a17:90b:4e84:b0:381:28e0:6262 with SMTP id 98e67ed59e1d1-38dc74cf2a8mr1540953a91.8.1783741053882;
        Fri, 10 Jul 2026 20:37:33 -0700 (PDT)
Received: from penguin.tail0a1999.ts.net (61-228-52-13.dynamic-ip.hinet.net. [61.228.52.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38dc9fc78ffsm269900a91.9.2026.07.10.20.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 20:37:33 -0700 (PDT)
From: Shih-Yuan Lee <fourdollars@debian.org>
To: Henrik Rydberg <rydberg@bitmath.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Armin Wolf <W_Armin@gmx.de>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shih-Yuan Lee <fourdollars@debian.org>
Subject: [PATCH v2 0/1] hwmon: (applesmc) Convert to hwmon_device_register_with_info
Date: Sat, 11 Jul 2026 11:36:59 +0800
Message-Id: <20260711033700.3693-1-fourdollars@debian.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260710123236.10508-1-fourdollars@debian.org>
References: <20260710123236.10508-1-fourdollars@debian.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Guenter, Armin, and Henrik,

This is v2 of the patch series converting the applesmc driver from using
the deprecated hwmon_device_register() function to the modern
hwmon_device_register_with_info() API.

Changes in v2:
- Abandon the minimal dummy registration approach in v1.
- Fully convert the driver to modern HWMON ABI standards by dynamically
  allocating temp and fan channels at initialization.
- Rename legacy non-standard attributes to comply with the standard HWMON ABI:
  - fanX_output -> fanX_target (HWMON_F_TARGET)
  - fanX_manual -> pwmX_enable (HWMON_PWM_ENABLE)
- Dynamically register the remaining non-standard fanX_safe attributes
  under HWMON class directory via extra_groups.
- Load and cache fan positions in smcreg.fan_positions to support returning
  labels by reference in .read_string.
- Clean up unused static attribute groups and show/store callback functions
  to avoid unused symbol compiler warnings.
- Verified compilation and successfully tested on real MacBook hardware.

We appreciate your review and comments on this proper refactoring.

Shih-Yuan Lee (1):
  hwmon: (applesmc) Convert to hwmon_device_register_with_info

 drivers/hwmon/applesmc.c | 458 ++++++++++++++++++++++++++-------------
 1 file changed, 309 insertions(+), 149 deletions(-)

-- 
2.39.5

