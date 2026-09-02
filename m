Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAFB41686D
	for <linux-hwmon@vger.kernel.org>; Wed,  2 Sep 2026 21:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788385151; cv=none; b=qDe/GkWduOiNUStshzX1bwqkBJzVEEz0ZYlVx3++JFl+eqqtz5BJmerQ6qLvPENWwSMmrZ5g2/oIERHmNsRwP6OXKnKj61qQKl66+ryiX4UU44CX1cqrMEBK/BFB3ffwt0moFJcyxIESzqoSsXPm9nY0ZIKiw8JOM5slM50RJbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788385151; c=relaxed/simple;
	bh=VCeTB6DA6xhpX0r0q0Xnripoc1RfKaEs1YtzFpOgihQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jIpuyhNyQGKsmAdRLX9FifTjbAKHJZjccwuqhC3Wsaiep+6xp0kw10yL8DYvdVpRDgaFQnntY7wuW3wyQE0JSyGDevWlZ1U0OqKI5YJsmOFuKFqGeAb92kNqfBo+P+NDM/6+EPmmNBo4SrbBs0kY5JSoX0P2nleATIWS+iL3gek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4KlZuEZ; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4KlZuEZ"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-381b831d535so2557058a91.0
        for <linux-hwmon@vger.kernel.org>; Wed, 02 Sep 2026 14:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788385134; x=1788989934; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=51ibZFOFagQ+E9ZIDyF6lkMloDUoQoVNjs4ypi5okac=;
        b=E4KlZuEZkT1KfbSLisjkwWi7JEyEk+K4nuog4aSXS81zzVZ0fDTb70pmhzTV16XguG
         u8gJQ3SK+eRAgtdnPUgsTRLSbfBFcASfF2WnZHNySEc+LXmhLsxEobCQnlraPc3a4Jkm
         pFl+bL+ET0fnD9U32EYde24Lc4HAu+YNaBzhpBJCcB+Z4TfeZYW1JV+GJYUhu76blfuX
         KFwzMhsczPUeXMy0OxpbreRsW3y9gjVbsaaRevYo41cjC5ypnWVBToEQA90PDKAcjsXX
         CcvNIaLG8RJ/de483JaYnQbEYPtiNDs2HMWPzKHQgXHbbDO8Xin16/4+4jjMRJhRXPsm
         4zcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788385134; x=1788989934;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=51ibZFOFagQ+E9ZIDyF6lkMloDUoQoVNjs4ypi5okac=;
        b=OhUEY3lYMAA3wmPR/0GUW6v8/n2WVMiVB1x83vYTvZ+xlXmdNxmtuEpE3dwGmjoe7M
         1h11ey2ZiCNf4R8rFynG7MWRqFF7QRjHPF+wVf4ZkTaHuugkr29jWJy6c5Oo3fPN0VfN
         KQWVQ4aZt4gkLFhWkimGZ3f62OWTWyb/UG1xuPN4ZX3plESGmI4/q+v3OGyy40reHc7m
         HNHmswMkoNOdsFbu3gPJteQ7ZdKC33Pa+h6PaaIwnnK/oNCptJ9wcDsjMAZB/fQ7zdVm
         fxoG9p4Ne78JTqdAMG0ySorcSEs025TBMvTVDvv96La4Eie0fwjKuDzlC3URX4dLDq7A
         gu1A==
X-Forwarded-Encrypted: i=1; AKwUvBx1kYbW5hxRimc6VuUFKgpABSAEXexMr3ZxMzvHnrBRKm2iLglC22n0d7As7aLp8jcv6Q/saI0CDTzUNQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kMqQA5Fi90cgXqyMc1BTlgPsbhdcC1/W6AlbCI8I1H0B647QXF
	d32ILHZOGac7Mnb4gmu2is9D2GTuQv23Ftecyo0+nr6UgrA3Uv8+kGUU
X-Gm-Gg: AYBFou1R8patbfA3IlDuwzZiRcAvRCSCHZy2tE7U6WXJ0rBYQupfhloizoyDO9VGsKz
	5fimAg37SJLqhoM1sCu6jgSFUWqfQE/z6D4boznR+sK9MfVzRz+lnF2ceb16z0Zmon/RVaLwqSg
	OgiPVwl1qc5C5DFRuM4fWJRLf3Glzz/prH8CpyiSUABRd5+AviAxo4KCPcfCay1uBVz88bfZOrR
	8nGPCNybkQhgaUbHfBHFzj5omQdrkspvXmBIFXyPBWXTY5v6mTmxB2KZSQOqJ+pcsxs1sMzB06J
	42dUjtIqXMszYejG9TEUtqpB4nOydBLt9eSRcwFR7k6tNgoRb2qz74ful47DJnTReJx1z0hspaR
	GFsSgAcxZCdNWVa8oSHLjMi5ASHmLsN06pG+2QPvj60xqBefnrYHZwmLiYoshR7MarvuKaNX3FU
	lqsAoQ+h/SmO5uPd6INqZ8h9SnBAL4krLkFP8eXoBcyuPUiOvHYi32mFcRM3hYMNCLj17ZQIize
	w==
X-Received: by 2002:a17:90b:4fc5:b0:38e:49c0:75a7 with SMTP id 98e67ed59e1d1-39aedfe18c0mr12990696a91.8.1788385133676;
        Wed, 02 Sep 2026 14:38:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0875e5e9sm1358930a91.14.2026.09.02.14.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 14:38:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 2 Sep 2026 14:38:52 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH 2/2] hwmon: (pmbus/tps53679) Add support for TPS53622 and
 TPS53659
Message-ID: <56544fb0-55af-4e1e-83a6-73107bc152ab@roeck-us.net>
References: <20260901211129.360792-1-sanman.pradhan@hpe.com>
 <20260901211129.360792-3-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901211129.360792-3-sanman.pradhan@hpe.com>

On Tue, Sep 01, 2026 at 09:11:53PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> TPS53622 and TPS53659 are dual-channel D-CAP+ step-down controllers that
> use the VID VOUT format and VOUT_MODE identification like the existing
> TPS53679/TPS53688, so they reuse tps53679_identify().
> 
> Shorten the Kconfig prompt to the family name and list the supported
> chips in the help text instead; this also adds TPS53685, which is already
> supported by the driver but was missing from the list. Update the driver
> documentation, including the per-attribute lists, and fix an existing
> "TPS53588" typo (should be TPS53688) in those lists.
> 
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Applied.

Thanks,
Guenter
