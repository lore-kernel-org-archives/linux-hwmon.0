Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792832763;
	b=JB8rHMnLZ2ZqvaW+lxtkYKBW+gI7QTMMaUykxbodSvja5ibM51mMSNkli3r1JnMduag5
	 Na39QMyKWUhxiZ8qKMo57X0xg/u/iY5TxgznmbP61gThzHstbxEr2zMLnZYx/2u/cXFhP
	 +90zcN4gjBxd0WbIkHyWGdYZj7MrRefBRUOr5lBgDd4S31606FftptFZDvYy7fXNN04Ty
	 +6Q7ZtgwBrKXE8bwV+TcBPJYpHTmHSUFN/GjFhWNj5F02xxaSWuPhFtykRnDvojKJ0Usg
	 e8GpZvE4k2I7sSgE8YrMyeNUNTWwxY1IhG7Jp2HM3fTWBZbs+73H/vT/SMlZhhz4D6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792832763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=fehn4L1x+4nWer8Oybpx12dXQG/hAlw09gDAggECqvM=;
	b=FQIRJgvKk2cVh+H87O1BqoQNc+QoKkYFMU2htw6McjG7NiYjKfTnMSj8BReTBxYdwYGo
	 QYfxcIMqibTbjWo7i2MsqPo3bAuS+mvhHxCZ5Ou3jza83Kx8KGNzLI4d1Wcz+zcq0UCKD
	 hgucOqPX3EpDI4vKEsXCn19iAzUGrAIRQN6BuyMcUYHuYGQ+XIWMuZEMi7ocB168BtZG+
	 +3wdbuO9NoT5bOTe68ozBlcGbptd2a/iQ3wx68gk13AVXFogl8uCMF63uWhdiFGVyjEbt
	 TqfJTFUQBBiJRei2PbH1DAXyItvVL1OGvCmLYY+/jXWWddWEA/Ijx+FZayns9aSy5MQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ik6IWooA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F517606A31A
	for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2026 09:06:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F517606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ik6IWooA
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso15706335e9.3
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2026 02:06:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792832761; cv=none;
        d=google.com; s=arc-20260327;
        b=Zf5Xba1EXATFG5eKQn9ky6QUBTtEXRVpF/oYrBUP4QnvBaPiULK77vZATMuj6O7quT
         jXQMT90b+iulH4DTihOFSJbUIGdzLZ35Nr7AOjDmsp9z+vbpz0kikuMK82bQnTSmYdFQ
         I1kRYPhlv/zWOB1Ece4wEJRVRfGZ0fUs7xtPDPvIFigo6LLuEjGBqey29hUJLD6VwAJ0
         EOOxjk53fjXK7MFMUY76N5oXrhy47FYebiJM5I7gaSNLbbolWVxkCtnQ+PP99wrcGwZ7
         zPof+WTuegEeLOlUfgaZmNPw5yfebVqUNDAeebANUprF/3favWaPpEG3EmYlI7LXIhLP
         LDvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fehn4L1x+4nWer8Oybpx12dXQG/hAlw09gDAggECqvM=;
        fh=YN43KaIt8anRLIdoiol4EESnR/HKKFaDOwl3s/eeI0o=;
        b=AtXGY6PVrP+xlXlhFCOKayaZoSei4Vt1L+fSk+vTpTk2rYOvjidma2yBZBzyxaKOgM
         tS2rotIJgjMYyjp/Mf3t7vEta4rOMP3zsVSHbXOrNdiiJa5DeLCi/DmaG8H4LGbfOZeu
         fNH9yz0MqDjWdouXXmBe0C/16wuT1B9QZrxc6VyoMrfWPinT4wE+02Kx3D4trQYDZbA+
         oWmpR3lwwjMz/3N4uwfE1R2nwzi+R0so0QydOafxNgzKlWDx8sst5xNjTCP3tAT4vTyr
         l3LOMwhraA1ubF6+LOsoR/uth9P4zI8S2B8st1iUQ23KZX86JXGyREv1JIIbTnrPyVY2
         vd1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792832761; x=1793437561; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fehn4L1x+4nWer8Oybpx12dXQG/hAlw09gDAggECqvM=;
        b=Ik6IWooA2WKcrLsnSZS34Bpb7ajRtRtiHPAvQ79V6rHKyFSch+ZKIxbbjKj0VfhDqR
         ktfx4Yf9+C+S29v4Oj81GOJQt4/NJJxZDr7NmN9ptOZhT9w9zz1agzV9/QXMM+PyLezK
         uaXQbH96q/g4MMvUgNvtbxm/GepC8TocjOYw2PG0R3rmG5s7a48sxIes+c4td7be5nLg
         Sdn6E4077lvNtCLr6KUiwyBc26DPo/PePzXVfQvwTvtyyGbuLtPRh8gzWzZ4JnVOyICM
         3ugPf3PudgaROEA1YVNa6caIRhQ08PR3awv/9bw1hPzD7bM3KyQ6P3Zmo6/1SWCEHhxR
         F5Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792832761; x=1793437561;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fehn4L1x+4nWer8Oybpx12dXQG/hAlw09gDAggECqvM=;
        b=brAkEJVmSfu0Uo+cC6vXt/2+VnxhR4dnz+aQ4xKG5Mx7apNNWw2zaniV0o3YSp+y3u
         00Y1vC4c6F9Sv/lPPnZ/4GD0usa3y/6Zbs73o/ymF/efvgqT51uyHDo/nmK0jWsW8fap
         0tY0pRzbBKfEav4hTntSGFehVaTZ5oe6CX+gvwecCMQfPBHnHHtPJM6qak329UdyZrg+
         TQHAVhcGCSqRhM/4VHJzJedUZLFoFfJkGlrargIkesG4OmVcDet7dNo5+Fj3bK7U2P2c
         ya0QfG1iy0biLNwkD1xFGSvwScR01w4ntb227jeN7Q9bhY5ADhF7KUVEmxS3DxaP7hjQ
         SVyg==
X-Forwarded-Encrypted: i=1; AKwUvBxrio37lZ57e4VHQK0HFxp5+UNG5vDH2sWWTwCYLuUfrO0gjUpCazVXMLLtlQFNNmpUn/KmbJvv+GiN8Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYK5SH67S7NOCXn4304o38cNLwUC+m0t0pKMuu5jFTttTX0hiqfv
	9LNZRL9IJdjFKhF4371jwaexwppBG+mCBPHfEjsAWC9R01RiCkZvESdg1hkK0s/PAfWIA0kfJFl
	gcnO3CHH/nId79w0eNar73ipbvBfAR/+sLmkGF0M=
X-Gm-Gg: AYBFou0/obFklAHxvZ7bJmw8FiqD2OCmRKyn2XZcxgCoHps+CDYCeqZEUIVdOkiO+/5
	yEYO0+hDzbULPcC51flccYn7OEo89TIbw2Oy4rXz1A82AdHmWkpQ4cpK536+yQJI/8Frev50Lt1
	AEZvAMYTVKeZyq5Z3KS/ktisNKIuFQ4cuxNcmNmY/YA/FBFwWXSN6XPiNCM95Sb6lB/AD9XwR2s
	9liFpPO+2bvQAB8yDhvpRcyATFVNiT9lNIaDFuZlnz+a3b9zL1+xqqP3XofCt8ycCjgY0G5Vc0I
	AjCpzX93F6SHZxfFXGL/37N9ZzuBL0P14ffC4jyINWRLpJMvL45hO9Nf+ctK5U0ODxrQt16WMLw
	U8ME1WRdbDdlSKTk88r7hOKsOQ9H+n65dn/a/
X-Received: by 2002:a05:600c:4f55:b0:4a3:598e:e7a8 with SMTP id
 5b1f17b1804b1-4a35ac3d022mr24134735e9.4.1792832761474; Sat, 24 Oct 2026
 02:06:01 -0700 (PDT)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024035735.6810-1-W_Armin@gmx.de>
In-Reply-To: <20261024035735.6810-1-W_Armin@gmx.de>
From: Sergei Migunov <serjo32.games@gmail.com>
Date: Sat, 24 Oct 2026 12:05:49 +0300
X-Gm-Features: AclHuK9wUs4scABeMPO80oA4UNOH6XzDoAhXXabC0VuKkF_qGjo0fv9kst0YuFE
Message-ID: <CAMSNfTgwcpi=XQGpEp-ODLZxeA9wbW5K_erprgfQovPoQhjNoQ@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon: (dell-smm) Add Dell Pro Micro Plus QBM1250 to
 fan control whitelist
To: Armin Wolf <W_Armin@gmx.de>
Cc: pali@kernel.org, linux@roeck-us.net, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 24 Oct 2026 at 06:57, Armin Wolf <W_Armin@gmx.de> wrote:
> A user reported that the Dell Pro Micro Plus QBM1250 needs to be
> whitelisted for the special SMM calls necessary for globally
> enabling/disabling BIOS fan control.

Thanks, Armin! The Co-developed-by and Signed-off-by tags are fine
with me.

I have been running exactly this whitelist entry (same DMI match,
I8K_FAN_30A3_31A3) on a Dell Pro Micro Plus QBM1250 (BIOS 1.18.2,
kernel 6.17.0-1033-oem) for two weeks: pwm1_enable appears, manual
mode takes the fan to full speed (~4000 RPM), and writing 2 hands
control back to the BIOS.

Tested-by: Sergei <serjo32.games@gmail.com>

Sergei
