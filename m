Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A6E286D56
	for <linux-hwmon@vger.kernel.org>; Sat, 20 Jun 2026 07:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781941655; cv=none; b=GR+4YsWjfOIS1ERnWmM0gA+oGaWCXjERUBtZTmHhlgIo8RgJ7c1vpPYb2Bvgk8d8j583oZ2Wjy2ULOPC5SbwK+Y2ZDJbByaumNFYVrPEf1yx+fWlWfogeM+HjGOW9/LnlUoxAWAeJlUo5LydcfPYbqEwjuhtlCt53KFrdTcobj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781941655; c=relaxed/simple;
	bh=CGaSle0JP4NlvOHxZxH2Ie3emSkFSrdW2uVS1Av9j3U=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:MIME-Version; b=X5Cn+7K5Ob6u2Tbhf14rI6wqndCXUcSMOr64CRBsRVYKh/InMrgjHjNJW1FwxdneyTDMKXdMQEsyaEDVMi4giEStZm07Bn+R5yonswM/2ttShDdkgWX0/75K9p8rEhNh1lenYNQ/Cpa4cFReoJQ9rz3nwuXVckahxGDchcEhZOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=MFazFSVJ; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="MFazFSVJ"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1384ebe7a10so5712792c88.1
        for <linux-hwmon@vger.kernel.org>; Sat, 20 Jun 2026 00:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1781941653; x=1782546453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:cc:to
         :from:subject:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CGaSle0JP4NlvOHxZxH2Ie3emSkFSrdW2uVS1Av9j3U=;
        b=MFazFSVJXBwWsndp/nvZiYijdKTo97x0KxyVlIWT4Tadd708HLSthoQP+JkCychsZE
         ec7xPg7lCmHv09JZBi+5QIB6QJB8VW0JoURQnuX3B/bvRKsrCy3gck1Ax1fv9H0eAZV2
         MZfUA1t5HgpPEGZ/kG9iPaO/lnM3uGEy+ljrEKVVaV3UhJWGszQYEUTE539nNkCM38YT
         Uv5XNIVDh19eJPD4ctt4jzZPVTbJNlrp05N38sFeFkv9zIYCICrGSfYdjKjEvmR1p/5+
         wiWiEF9eSnO4ipbyAAcnEQ1FwUOOO/6Cx3gdrhUK/fRLxjk/k2Klxs3vDYLBhfLWYdk8
         A7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781941653; x=1782546453;
        h=content-transfer-encoding:mime-version:references:in-reply-to:cc:to
         :from:subject:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CGaSle0JP4NlvOHxZxH2Ie3emSkFSrdW2uVS1Av9j3U=;
        b=PLnG7faqC4PXW+1mMWQNbb0sY5PSXhTVsUTqf9MEAKmy1sQnT6g75PQEpkXKmOxm+m
         6pIwT/itX1h5/XhEdZVILzBclB6r4uPLWGCXhDbI1aImc1fx5hbp7kn9s8jVBmp9zB8W
         NK2WCUtYzxuLSgLp3RYZW5EcrjWrjinSOxK1y6gCEdNST5IEBORZ5tDJyMJ0vpZLfbiD
         5XKtRNml6jBKKfkmd8T4pUOBj44jIimlithG6S1QQTUMZHwlJzjRrIqX2BbqItojvU5L
         O8JTAsnU7Q/A/r2/DMH4nieqY6oxHmkTP9YedD4vDOg6KXzPkzAx+Jb1jGlwb8nIlCGB
         ZCbQ==
X-Gm-Message-State: AOJu0Yx5cbfk0NPfD+AP2txVB9xETs+WTf9G9VhwlTKpjk8DC40qL8xN
	6oVmDddot0QLe01J7qi9gFml1oiFALi+ojQU6lPnMQQxFNX6GfwhMFQOBPB28A2AkmE=
X-Gm-Gg: AfdE7cl0bb7+3eRc8VXpknx8lldLUSaKCGfEAmXqvWcNgqIfawe9NIzO+vBp7LK4ulo
	qvO9bGqF25uA4a5VU8wxdndYnRD/R8TaDfn46z/6RvLTG7qQepqyHIi+xNy8L15g1HcIoI0inEw
	e2OmueZjc83tnv9NR1ZtYuFSOND8RtXrzXk8+dslE0JlnFcEYyZ/fO/yhSe9NuaEgh6ip7xlsCd
	2vjXiV9VuaQU8A/h8DQ+ASTgHn1xXi9GQ2039O8CDoTRZUWjBP8Byi6SaRFnulMG9cGWrxJUOMB
	tTbGuDWx6k1Dn/LbE5Pxchj0PzhRVfkqjJUKoW35QrWvyyBwlwVEegVb2StVx+qx4fjCs7WainK
	uwK3IOoWZLkIi59wqt4iMdl5z0Q+9cSnNzo77ZWvPYIasnMXPOKKHoxLmX5oNHsKThdkAyOMue9
	KUs60cswsfHUjh
X-Received: by 2002:a05:7022:4383:b0:12d:b7e5:a691 with SMTP id a92af1059eb24-139a4eb8b1fmr2876221c88.7.1781941652989;
        Sat, 20 Jun 2026 00:47:32 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139add81933sm1826956c88.14.2026.06.20.00.47.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Jun 2026 00:47:32 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 20 Jun 2026 00:47:31 -0700
Message-Id: <DJDPLHR74OJJ.1H86LMMNB3YMN@nexthop.ai>
Subject: Re: [PATCH] hwmon: (pmbus/xdpe1a2g7b) Add regulator support
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: <sashiko-reviews@lists.linux.dev>
Cc: <linux-hwmon@vger.kernel.org>, <linux@roeck-us.net>,
 <ashish.yadav@infineon.com>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20260620065358.0FA801F000E9@smtp.kernel.org>
References: <20260619-xdpe1a2g7b-v1-1-428c3847be0d@nexthop.ai>
	<20260620065358.0FA801F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 20 Jun 2026 06:53:57 +0000, sashiko-bot@kernel.org wrote:
> [Severity: Critical]
> This is a pre-existing issue, but does enabling regulator support here expose
> attached hardware to destructive voltages when operating in nvidia195mv VID
> mode?
>
> The core PMBus framework translates microvolts into raw register encodings via
> pmbus_data2reg_vid(), but it currently hardcodes the VR11 VID calculation
> formula and completely ignores the vrm_version parameter configured by the
> driver.

Good catch! Confirmed: pmbus_data2reg_vid() ignores vrm_version while its
read counterpart pmbus_reg2data_vid() already switches on it, so a non-VR11
driver that exposes a regulator -- or any hwmon vout_command setter -- will
write VR11-encoded values into the chip. For an nvidia195mv part this turns
a 200 mV request into VID 0xB2, which the chip interprets as 1080 mV.

I'll send the core fix as a separate prerequisite patch (mirroring
pmbus_reg2data_vid() so writes round-trip with reads) and respin this
series on top of it.

Thanks,
Abdurrahman
