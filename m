Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A10D377016
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Apr 2026 07:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775720155; cv=pass; b=pYH0VBdYlcku9jjHUS2Jms0VXZq8YZlykCB1o8/WdwdNx7p4cHbFjW0t13cwdhTcxrMFsDr5FJbYEqv6jy14rWlP/dveaglkaVJiMYcJHkvlRd1RgFO0TjoLTVhMcGFNwwYGAdQtKFWNiALnxp5xQMZFIEd+WEfLVKnkWUu/K0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775720155; c=relaxed/simple;
	bh=+I4LPu6lfLDXT4uyQeRUaEx5//BpTwSnuLZT59p4FBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m6zZpzvIx/Y58J/c/NH6c0d34nNEAz+6WQol8yAKRCjqyU2i8mvqM3bm3SiTtRrT6sWx6Cr5GsjJeEoU18MaH9NA2LIC1wTvy9Y0KvIrUuoNrM6E5Ij/aqnwWLHgR54Of8COC2XJQKPmJD5Zr09JDRs614nQZrRPRsABQGPdo3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pb1BQANn; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pb1BQANn"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-358d80f60ccso444827a91.3
        for <linux-hwmon@vger.kernel.org>; Thu, 09 Apr 2026 00:35:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775720153; cv=none;
        d=google.com; s=arc-20240605;
        b=KOFVsxImC7eNEBYbsaFDSg/O46X0FA7fIpSOoy1RVdviQC8zOzizXWqr26iqdGJDKe
         tTha/n+Xa1vhDBgiVnMQyQNdvheYCqVKf4WN20dU55iRYn7nYTxmg497QZkqZ7zgqglX
         jVsBkuPvPfUVpDoeg0MBOgLppVtsuv18bSEoQ8pAWsZauvp9YwR+Vj9n32gowm85KMV0
         7v+F2BbLjci9IJpkx3Qj6u+C+iby7/1hVIHG+WD4VbSBL7h4Hc/Gr0qhzSMTveTjk1pl
         qxx5hAlbOeo9YD7BZfGXEgj980FK8mBp6eWKOcvv9uDubuTULq+LkBk0Rfi7iFos6Zvz
         PThA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+I4LPu6lfLDXT4uyQeRUaEx5//BpTwSnuLZT59p4FBY=;
        fh=8yvEE2JctN557zUZR1pFu5tgIKw+9D1JgIGaRgl9JVM=;
        b=SPREI78b3uoRsC1Irzq4bACnu2z7gTB7EnC15/KQ2WQ3XZFiLM8ZVLwUIVcKy7/caB
         2EwIx0mRZBIzaO3tx95tnD13+AAsA1J0cKTrwKOM5FWiqPJVnoHZq7Cc+FsFtYVMTbo9
         2sQtjJphkeE9n53Q3K3GJc4v0dm2wHVwRlE0soGy1yKZF4LNVU77lllZr4mIi9LtZEV7
         fGCRna6wRR6/0AB9YPztEuSyxoZ4VLzJYF1fxTZfLglwLg2VouWRaS72AGkEa08sx3r5
         sFVWjOu61NsNeaIcR2XZH2vLyZkCAwmK/eW9V/IcKjQNbDk1WfZ/cqTaZOhHhea5sawW
         tKaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775720153; x=1776324953; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+I4LPu6lfLDXT4uyQeRUaEx5//BpTwSnuLZT59p4FBY=;
        b=pb1BQANnMCblMowLnhRNOXqhQUsosMR2fYdGUyjVhrin+POk0d5yNXaDmzrtIMG8aZ
         iTpPXlbwpTjIELKZSn0jPo3LxnJgWuM/WxJZSvUIJo8dfstESRGKfNPTS230MzE3oDrz
         uVzVBQou2t4rBjvRdaTP++IhMoeBpZnw13NmZExGN3lxG+RqcGybAyWeVfwHTJ7jxN7N
         3PlMQQuAyNIoPLWWBOscEpTjTP4N1f2wl8Ot8bvA6qYgXOCb4xwXPSrEpFvwGXenS/i/
         w+PVndEpKso05li2qrKthjoGpw/esW2KUgXhM+TVj8mbVAP3Z5PVFYjl3dYcWFKTl4VS
         49yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775720153; x=1776324953;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+I4LPu6lfLDXT4uyQeRUaEx5//BpTwSnuLZT59p4FBY=;
        b=MdYDCEQtkKP5i84jXKfX9QbJJXAuxEUjbG3FNdZ6gPa+EDD8abDSJngpjTKBUnQ1OW
         fd8zXbysnMCSjIeQkRLYgEC28ifFjvKUyqWMce77EL2YRRpUC08Nj7zTpNaPdaiJTJ+C
         VZp0DFB7WJF/3QbA0SmCqPHuvldNOUUJCw7bHv5ydPaJu/IFVlpXDUCbVezWE4XmdAU4
         g4PsPZT9TAWOgcDmiwKNjWGB+SsnEv5zQ8kHl6gZsBbFmSOrzoYC4FqWZivSkWGszKhN
         ZX2D7xwEJJZsjkP8jeNmNqVgcPlpx2HS6GmThysgwhvak70N+3jjDFV3UhyyVaiyDp/A
         Mo6g==
X-Gm-Message-State: AOJu0YyUcpSWcgRIvq2NFajzIvmC55wkrffwvajYJl36wlPP9dGUAAO5
	q3uzSQitSu00MuDwk+woR5XXFGlV/SgTIz9vG2nAWJdtKwFeJq+C4ID3+k+K21V8NuSQHve0Cq2
	iZxsyT3+WzlK/81FFdCdZlG5qRus2eek=
X-Gm-Gg: AeBDietAcoj5Bdu+YpKMfqjfknG0KL7ZKMCPwgPLXnsyS/jagDchfbFspaNOLlJ/SUZ
	8x0B1y9EIZXpp4sayMO/y4QVr9aS3JtQ5RST6vFYUdpy5qeaWxG2+UrN98ZONV3n5XsNhdLCf0o
	IQQwzhzPcn5IG1esujdy7FAfgeCmW02COBhZxAnlha3AfpH7sDPlekVqyHlVsW8eJVhCFRqrwzV
	0boH6vgk+zhukRJDyEuDUgG3VmCGr/OeIv86zAGzauKCL+v/Je5tv58rgT3+NDrceF0ukjyEJQM
	MZjRt6TDlpC27TBxHXYJ8z6DclwvYtHW9AK9vUQT
X-Received: by 2002:a17:90b:4c4b:b0:35d:a9bb:1e41 with SMTP id
 98e67ed59e1d1-35de680ddb6mr25208370a91.10.1775720153415; Thu, 09 Apr 2026
 00:35:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANNcQFEFFBt7rBuaV8gwqWnbsU+fDGHaLJORq4YkkfZ9jhzAOQ@mail.gmail.com>
In-Reply-To: <CANNcQFEFFBt7rBuaV8gwqWnbsU+fDGHaLJORq4YkkfZ9jhzAOQ@mail.gmail.com>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Thu, 9 Apr 2026 09:35:42 +0200
X-Gm-Features: AQROBzActxYHgauwL4HaDvqixL0kqZck41yS6tUsYfdbwuqkH1saZdTEncCW2Tw
Message-ID: <CAB95QAR-HTf51r-qcTEPyJJY=+u=g+ycAJ5ZJvJZWo0uT0WoSg@mail.gmail.com>
Subject: Re: [PATCH] hwmon: asus-ec-sensors: Add ASUS TUF Gaming F17 FX706LI
To: Saravanan M <saravananchatgptonly@gmail.com>
Cc: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

ec_board_info::family has to be set to a proper value, and not to
board_family::family_unknown.

Eugene
