Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E01C3D3009
	for <linux-hwmon@vger.kernel.org>; Sun, 18 Oct 2026 16:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792340245; cv=none; b=QS9wxw/U4hOkijKzkUJ4E/hfjYH2ImPXd9eCi967QyeCTpTwvcx+6zdAsKxnk/KbPwxZUmu6HqVYxFlu7dlgDA6vCqTLmd53MlVWDrJJa9fA6qLKFbPF8JbQywwA8/IFkvIU1YzfM+7utgz3jlrMemlFQU4P3M9B8u6bhABwAiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792340245; c=relaxed/simple;
	bh=qRz9Iph9WZ4PmLNOan/569VXzYpC5lJjl4Az2upM1VU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RUbxfbCD7MBbsEQ+EBlrJUqC1PUW+e9ZAKYdCDWqaqWlc3tjUcZnvdD5CeXEhRUp8+aaVdZTaoP6Tpzzo8jcNjWK+eS9Rgc2I+ntOQ3O8dxsOph+I3xz3fWN1rKfU738GwcE/ih2M1IwujhxNtZai5jj0ESyw13233QN8NAaJ34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SaMPg3C2; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SaMPg3C2"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3acc96a256dso896251a91.3
        for <linux-hwmon@vger.kernel.org>; Sun, 18 Oct 2026 09:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792340244; x=1792945044; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wuuP/d4fZ+H7PWNHmPup9rN7/ZBi6CnPg8tJ8URN2BM=;
        b=SaMPg3C2gW5SXLk5gkN4q59W9vH+mrDLCLxA/H3VfOEgxaat59IekykewHiaE4+HDH
         u0FBOHkLIrEgiG19x6SNNTpxrhsO2hxBnvTbGBjGfS9K5UeNMOW+VjCeeh9++jIhDB1j
         fndOKFji/MkZoVPu3QoC3oIVBOh3dTNxGCgQYeRkoyQXyr+N4XBaD1+LSnc+X/RHY5RR
         UDddp/PcsAR9PTVRZiZOYh/1GKxXXtJo+OF2VvMRX0YZxen0JlPji8iWrAEbpNkvVnnE
         Oj6g4gzJsJ77lrB52UcubPkoGi1YWq7HEj4RhfG0zXqLozNvcLv3JAxnOYgbYZGW63LS
         Eh5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792340244; x=1792945044;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wuuP/d4fZ+H7PWNHmPup9rN7/ZBi6CnPg8tJ8URN2BM=;
        b=2mIZgwWjO7XIgURdzLVNtxRqleLwXlyLjYdmchheKBBMbgkAN0BINFIvRg91/ko2fX
         90/GMc7EquqBzFiNuLYLTzUCvu8U09BjIQsNuXo+UlWQ6gWSu3j2zKHMCCuQt07IovAc
         KzPcBAfglFQolNH3vRqms4d3oGy/hXkSNwa9RmxZMwnRxAdk46mVsMRf7uVNM745xOXR
         BAtdlw9SHLsXTQaRTu6f/ukSGPrVD3OoSEU9REj03D3OE3PwB0Qt4E/zK45zDpocyrDz
         GmhKuEo8RQGIyT8iQQh2OyE9bnOzXb44ZPMEyZ2/X8Jj9BsGDyEok9JboFH/mYArp8V2
         SVTQ==
X-Gm-Message-State: AFq9FYLM3q6mjMgETVbN0W6hq6DEPIEiu4KpCIygCGD9dVtvz6qhqRAj
	GjNwNVAgD/LdEdf9MAd5/g4IWjK8ssuZ5y+y1Ex4j4n0Ct8xi+4g9w1U
X-Gm-Gg: AYBFou1HoAuXIEN9DDRZYTbjQiXelKIwVdQtjey+NDLA/b5UplsJ4mGjUeX3zGhSmmf
	oUgFbPiKN5CRCKy9SjcBYfLARKSsXbxitIqp3iEX0Hs72Xom69U61NI+laIMLCl0wm1tRttBXev
	qWsxmDChLb2ccS/l4czaipte1RlpKp3nT55AR24wDlenDvQoC1Z/1JWuCPUXHKiQxE34BdZKFN9
	lX+M1ISzUuVcnpkObHdDQQVpHKCqhgZtbaw+RGojaRnkzZY0hC3FCileY7B0lQv3LP1xS/Z5u6g
	kteW7Q472j1C08Wu2wNfBrhSXhIvnFRuOLrbJSkLvPTg7Gfj1+mYcLrWiaKy8BhhbE8czF4zfEr
	CXcPqirwFnNSMaXk+Mo+YrEST9ZDyKY1N1jkalzwArkTUrdGphCuxQsW3hxhsaEO8mjrBY13aH5
	lOVtBk6sOvAWq0uzobnWf1Jli14IOyIuPoQqwEbEsRwHvKE9a0ttoJ9Umxs3s35kIxF91NbC6YL
	vr9n3pldirpPRbc+gbAeYA=
X-Received: by 2002:a17:90b:3b86:b0:3ab:2737:3396 with SMTP id 98e67ed59e1d1-3acef5f1d2dmr4858924a91.65.1792340243868;
        Sun, 18 Oct 2026 09:17:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac945e74bcsm17656338a91.3.2026.10.18.09.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 09:17:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 18 Oct 2026 09:17:22 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: =?iso-8859-1?Q?Sebasti=E1n?= Peyrott <speyrott@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (minisforum-um780xtx) Avoid overflow when
 rounding threshold input
Message-ID: <853e8069-cd0d-469b-ae13-82f756695aa9@roeck-us.net>
References: <20261015033841.390615-1-speyrott@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261015033841.390615-1-speyrott@gmail.com>

On Thu, Oct 15, 2026 at 12:38:41AM -0300, Sebastián Peyrott wrote:
> The SYS fan threshold store path rounds the user-supplied millidegree value
> with DIV_ROUND_CLOSEST() before clamping it. DIV_ROUND_CLOSEST() adds or
> subtracts half the divisor first, so inputs within 500 of LONG_MAX or
> LONG_MIN overflow and change sign. Writing LONG_MAX then selects the lower
> limit instead of the upper one, and LONG_MIN the upper limit instead of the
> lower one.
> 
> Clamp the input to the representable 0..255000 range before rounding. The
> result is unchanged for all other inputs, because the subsequent clamp
> already limits the threshold to 0..254 degrees.
> 
> Fixes: 9d980da93bbc ("hwmon: Add Minisforum UM780 XTX EC monitoring and fan control")
> Reported-by: Sashiko AI review <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/r/sashiko-outbox-171941@kernel.org
> Assisted-by: LLM
> Signed-off-by: Sebastián Peyrott <speyrott@gmail.com>

Applied.

Thanks,
Guenter
