Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78A94A091B
	for <linux-hwmon@vger.kernel.org>; Mon, 31 Aug 2026 18:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199419; cv=none; b=FSlfATrZTIKWtnno18dCstfnjAEsDUUWO7mhBYHOKOdxJn5NahgB9vYCJ/ce1jjJ/eQOsQzymDuJEzZmdaaX1cvHsubg0tnryjAQU7HnEZgvs3MUu1Ij3b8VChnn+UDUYZ5TKasJlMD/jyI0hn/k/S1nCEbFsTcEY+ocSJjN4o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199419; c=relaxed/simple;
	bh=rmq4A/3b9cJXS2TkfGSiciCNONWN4osSAMXLb20UGCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZ4e7gBOX4sC/ExhVAMGPGJCdlM90vcLhbG/li+bsqK9Yysr4ApCOp6Au2VZaTLkPIR0+Pv6I4WOqFAMIJ9luio5JbBZ612bWEFy47FZO/4qyx8I0ThR0/1f4CmM620DMDKba6iqPhoh+0J4kJIbes9I88UvPOtLWY7XHUF6Kfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BExlHJJ5; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BExlHJJ5"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d53197d8b5so31853775ad.3
        for <linux-hwmon@vger.kernel.org>; Mon, 31 Aug 2026 11:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199417; x=1788804217; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=scaTwoDAiAwCNDZtWleBwQ6YcnYnb/xcb5L8AHzEikQ=;
        b=BExlHJJ5As7llPGIPpe8Ch3cyhunebjXRJ8MIo9J373c8PKOxgJCxc9N2ON7uBN95H
         YyJYXFfrguRGG+fmop+3YNsHiX4PbpQy2SFOA+vSRgUulz1YVV6FwYE9rexh6vYujf5g
         CNzi+Adm7+bBo/y/NIb4PNvHyR4JEfmD/m+3RyL1nM7A0/nZbcBTqrwYzwldMzGk//OJ
         RJ4oRHAkO6lCc0y+lCDwd+E4UM6QOE7NebLL3MglMKu6pffmlOE0qMwOKPx5OUsZrV1H
         TfkSZrFRWvcWuCbtFvKTtRKXglO3TB3MyogRRvjjH389p8LlqXnFT50iqwmFauvHFqdG
         MhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199417; x=1788804217;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=scaTwoDAiAwCNDZtWleBwQ6YcnYnb/xcb5L8AHzEikQ=;
        b=RDnZOSSKurAzuxMTrcO9ajWdQjLFjjZu70WWqqutuYCEkY94J+lLxQw6Ir6nSRiP90
         6dw9T/HMnYJiR/mNjK7wqEIzoYbhJrwa2GyPOdQQuQLqzh7M9kN1zubWTTkXxKZ2/QCn
         W3wR7uXKivEoYI80UMfRgjpysoIGEJS468GH+jlSo3CoTf4uddN8S3kpURnZYAgajkeJ
         DK73DWaK2FWgGsJQnnuHxGqFs2+HntQfO2/NpJzk8qpBxnJt4wq8B06UyaTKPyOOVS0F
         60mR6MZC8p0oVHYCPW+rsQaVRgMy1HrwRsSwddMf/9z/wireZ95linTRGQ8SnSv0V/wv
         ZRIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHVVQq4JWU8jW3iJWLF1/o8R1+MBmoGRUbHrN4fxwAU9FCOLqup2W+el50uxEJdcc9MhgO1avcrj/Utw==@vger.kernel.org
X-Gm-Message-State: AFuF++nO+fqIy0r4GVwCKoI6iEJ/9Bgwbpf8n56kSVGiUf+OGCW1Tq3H
	2aAOhYD9OHw91OFjsIv1KY2o/LHTWgo8VQsDgqXMqQy3zE4hxFHZmjk5
X-Gm-Gg: AYBFou3KBtm4IRdE8KOiZrsNjZ87U8zFajfTjEc3cJJElL/wswGuHyA0exDjkiN6bWv
	xQ6HAA4CWY7PbnTq9lTyKfVaqoFb5ZLg35f9Zh5Gstu+YJx/YYqQsebe0SG8drMIADUOEHT66bx
	R7lYWQcO31uR9V/rdUZwKGZff9r4ppPlauK4X8MFrVPw3ng8OEZjzyZWbAiN0PFs2+KsIXCaMay
	sXZbf++7k/Oi4uG4kOE1fwDldoZecsFO2tXC9tUuVkcJ/F0c2aPCtL9yYM8jXL18JTllSRdvhNX
	42Tg3fbIM5JI631W+HGj/OmLofvXmOoemRQUkqO/njkT2+PoI6NXS+ttljVrkKrgqn7f/B4ucJx
	urIJOlz2V8ZWaOtmgDqjMbsjIZNSn+SX45/QKegR5Tis602aCM0JUyd8kUVuBeOz2uCoQfnpRda
	iA+0hgac3bdG3T/05zxfFqhRpTQy6jf66rXkKeQlLGwgLxVRiiUed2JAX3cMb/cQXtnzz2hLHL1
	w==
X-Received: by 2002:a17:902:ce8e:b0:2d7:107c:917b with SMTP id d9443c01a7336-2d94a32e0c0mr28121435ad.0.1788199417098;
        Mon, 31 Aug 2026 11:03:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7be607sm31904707eec.10.2026.08.31.11.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:03:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 31 Aug 2026 11:03:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Frank.Li@oss.nxp.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Wensheng Wang <wenswang@yeah.net>,
	Cosmo Chou <chou.cosmo@gmail.com>, Colin Huang <u8813345@gmail.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Antoni Pokusinski <apokusinski01@gmail.com>,
	Eddie James <eajames@linux.ibm.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: hwmon: tmp102: move ti,tmp103 out of
 trivial-devices.yaml
Message-ID: <25786645-f9c3-4fa7-b1a1-11b3704c3806@roeck-us.net>
References: <20260826211422.3299728-1-Frank.Li@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826211422.3299728-1-Frank.Li@oss.nxp.com>

On Wed, Aug 26, 2026 at 05:14:19PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Move ti,tmp103 binding from trivial-devices.yaml to ti,tmp102.yaml. Both
> devices are single temperature sensors and update "#thermal-sensor-cells"
> property to accept values 0 and 1 (passing no argument is equivalent to
> passing 0 as the first argument)
> 
> Fix below CHECK_DTBS warnings:
> arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dtb: temperature-sensor@70 (ti,tmp103): '#thermal-sensor-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
