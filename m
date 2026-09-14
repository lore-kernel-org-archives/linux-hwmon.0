Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35C8340281
	for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 21:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789423185; cv=none; b=B+de2tRkTTEUeY1YNz6P3aaEdfz+VRfJsk5qEWGBN5JksC9o6NNiGeaLFq7Oz3h5waLc1djKBsQhAP871vENMRpkwSFpaCWtpicFtddoADMnMnxuemzfxU4hWsNTWGbmgxglZSA+yAvIEiic2WfpM/yQxSFiwX7gOh0rNBm9NRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789423185; c=relaxed/simple;
	bh=+LzYP2KKgx177AigxhPhM8V1oWR5s8y8QPFx79rLFHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n1qdXw4FFcRFDa1K89cPVxUZ5810wyyYURKzyKGEukrsYm1JolNNkvajb8mtgCn10v8RvDB0kDTc0ga4e3avpoOkZseoXWRHZDrBtb+CeLLT6M5u5aZCBe95ZSIlPrUG/OMxBywxOpzvINtf6ctSusB9yimRliDFJBYcHDlfcuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vasily.cc; spf=pass smtp.mailfrom=vasily.cc; dkim=pass (2048-bit key) header.d=vasily.cc header.i=@vasily.cc header.b=FpEukLBW; arc=none smtp.client-ip=109.224.244.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vasily.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vasily.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vasily.cc header.i=@vasily.cc header.b="FpEukLBW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vasily.cc;
	s=protonmail2; t=1789423175; x=1789682375;
	bh=+LzYP2KKgx177AigxhPhM8V1oWR5s8y8QPFx79rLFHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=FpEukLBWsbWgfvXnEP6f6ux/H8eRJE+UQYZYgFTCYiotATFR8dg6+rdRpDK2TZAJk
	 DvCh1B4Pk1eZGYvWhvQ2yoszfA7CgDHFLCThxOuRCKJEcVyy1FYMeIvXdtivMECeI+
	 gMMD0GK/lAwI/+mbavUkV7iOGyq4kpBIz0ckAIQk4tiESA18lpxWU03Qw0ATT2hidq
	 7No0Pr4d0mO9Vt4tG7GMqpyGMxgUPE3WiKoDGJeIi1ZwpW2CqfknhF7B4cdzfiEL3h
	 rBQBh75DoRxEbMWeEU/Yvur3WsOz8KYRHAiO/fQvk+nZVZdbBNz0/irSQqRXl1EQhw
	 bPbL5HOzlUKFA==
X-Pm-Submission-Id: 4hkJw60H5lz1DDrw
From: Vas Zayarskiy <contact@vasily.cc>
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (aquacomputer_d5next) Add AMPINEL support
Date: Tue, 15 Sep 2026 00:59:17 +0300
Message-ID: <20260914215917.285155-1-contact@vasily.cc>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260914200831.5642E1F000FF@smtp.kernel.org>
References: <20260914195759.171524-1-contact@vasily.cc> <20260914200831.5642E1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Would it be better to add a hid_is_usb(hdev) check before attempting this
> cast?

Thanks for catching this. HID_USB_DEVICE() only matches the advertised bus;
UHID can supply BUS_USB while using a different low-level transport and a
non-USB parent. The cast therefore needs an actual transport check.

I have prepared v2 with hid_is_usb(hdev) checked before to_usb_interface(),
returning -ENODEV for other transports. A probe-prefix userspace harness
reaches the invalid-parent cast with v1 and rejects it before the cast with
v2. The real-USB telemetry and keyboard paths also pass the harness checks.

The revised module builds on 7.2.5; x86_64 and i386 object builds, sparse and
the 995-report parser replay pass. No crashing UHID device was created on
the host during testing.

Thanks,
Vas
