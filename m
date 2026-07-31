Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C61242B327
	for <linux-hwmon@vger.kernel.org>; Fri, 31 Jul 2026 14:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785508091; cv=none; b=AS+qXPybfu3MWooBpNEpOukLzRr1pEnGtp0q46nHilA45qYcdCwIbsnmyViPbL4kiQl9jlD6pfBzUDpRqyMB4YpuXDQJOFmyHJgCwz9tm6z5NEwxVJDxjh67bwy6FjyCk2Fdg0hlwUh6ML17LUL29nCwXKp5qLEQzQJ4YCmWdNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785508091; c=relaxed/simple;
	bh=edFieJ1NngPAWgAyLJoMFk0KLwhFjP40NLOCIGfVUQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=utPngX21yMUWJcq0czU8Ars/glRQTrL+HmC4IZRTR6R/X4HTzCd4KpB0WoZAu8Zl7ISpTL0uligUz5IRM6jHD4O4EDjuh9jYQ2RCZxsngpkeaOa+ENyS3ALh/otWTHxD3OJ5fp0SIl8ADHdWjzR0qATenuxsT1MazGXet5GLRjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M97DQ3yX; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M97DQ3yX"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cea3004256so11480355ad.0
        for <linux-hwmon@vger.kernel.org>; Fri, 31 Jul 2026 07:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785508089; x=1786112889; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jtRqUp5ioQJk376KJJx1DKpoRdIegI2ssFhD6hm1Q1s=;
        b=M97DQ3yXJYA/V1D6uTOgi/iFoMHZVbQh7J9tFEBcTV/0TQKDwkT/w+ydMUI3dUqQuI
         XJJuT2OGT3iT/z+/BKwxJwW3HVD7dZRBFRsI32o33w4SNaKdv9DCeIEdTJverj/Uv69v
         hfdhYeJ7Q+Uo2wQqE0jX2JPkLoRBnXWEoZwbcCSEuXtw8yVXmEoCFmSnQhmoUE2n3vP7
         ZTGIxpvOSPU5HOp8p85BPZQeZg84JQsElw33/5ktmz/OuOj3K1cNLk4ZsziAgnVGzXxf
         AzeyqkhzQQtgYx2pOlHrTcAwIqo5cpKY5fTjwxbbXbOb4Ui5jTS9KWq8KZkT8oL29Z6B
         Qwuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785508089; x=1786112889;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jtRqUp5ioQJk376KJJx1DKpoRdIegI2ssFhD6hm1Q1s=;
        b=QZP7FMKpCubkTHNFd9wnJKc+QivKe/2+/TU6+F8Li4JBMMZihyx1Z8mjDRh/hDHHrq
         TQE4IG3HrxRYbZ3S7QOpr2pX+spztTp2lig8/yYaHtbFhwHIaIGhteCqhtn+HkwBSN7v
         SPlSajucI+HNkcuVyNg4Hy6/tihJL55VybKfbDp4vzIbz4Om3MGu5bk+fqMk6SXHL/rI
         fGoJXOuli7suEfJSxIL8BXzLT+VhVpfgWoRvojRuRBtN6ZPHdrddBb1zzPJmcBftn4cD
         S5BhEMcgx9vH+IWBfmW8l622VzKQY93KFm/yTewUJ/E5f6na/I2QPF08xm+PcCKI2X0w
         E6Pg==
X-Forwarded-Encrypted: i=1; AHgh+RqnXaELWMLvdWd4eQThPnJ7AgVPU/THwyPpOsZuNxVFiMzsG5kUymI8K0Y5mgxhkJB4r7XQFss50Ia3RA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwT9YhL1R0jvFkJ1MJzpy/4pXppkZKIxMCfmNHwX66Sk0DHZhjh
	F0PFHx3+GmaFNq4a3aSXvcTVG0/nux8cMplCtZ0mNHbQkXqWVjqLhyGf
X-Gm-Gg: AR+sD12T0hgYiazdajeOFVIxSlZIez+AAdll1X61a7QAQ1nRVgA2YYF61lKU5HDg/Gj
	ly1rv14mBBxHIDEnSHe2kgPMLvIPsWMvkk7mGYGMaRuhJ7wZepOLIlWA1Q/zLYVQGbRwpCJcVOK
	Cmm60YWWAlY7LpL6JSj58/Szj7q0xEEIsNYpBDbIUY7+BC75srkQfUA28v8NTIsFrsiuR/PM5Vm
	MHAa9kahCOpLNxl74VVjEXcmiGO9vZjdRgoqZHCf68KW416DDbHO5S2ivRfwkcP8/Z31+EY5eNe
	f9Tj5iMK7+7d/itcNHo4KRmffmZ8Tvm5cxvBE7x5txLjFa9pA+q3sI1CUy2mDq74IlpNYQ/dtnC
	djb9ZLykLPOSthSmQ4oYYtCtNctYNM5hD+ZhwSU9jdx32TRri3tmUVo89PAq7YVMpIPf4DXEdCT
	UTE7sRZhuJe4uAo0Qtdm3obgytYErxyG58WDv+1qHwu0dTHSTq0C1S6rS05JarYpKeZFTt4qx6z
	1d9QEb4lN6z
X-Received: by 2002:a17:903:1110:b0:2ca:c01e:8837 with SMTP id d9443c01a7336-2d052428e6dmr1975785ad.24.1785508089234;
        Fri, 31 Jul 2026 07:28:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b11f9a9sm6027035ad.57.2026.07.31.07.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 07:28:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 31 Jul 2026 07:28:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vincent Jardin <vjardin@free.fr>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Charles Hsu <ythsu0511@gmail.com>,
	Markus Elfring <Markus.Elfring@web.de>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 1/4] hwmon: (pmbus/core) export
 pmbus_check_and_notify_faults()
Message-ID: <5e7ad6e1-7151-422f-a55b-1b116298e653@roeck-us.net>
References: <20260730-mpq8646_v0-v7-0-e7c7ad768d5d@free.fr>
 <20260730-mpq8646_v0-v7-1-e7c7ad768d5d@free.fr>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730-mpq8646_v0-v7-1-e7c7ad768d5d@free.fr>

On Thu, Jul 30, 2026 at 05:43:59PM +0200, Vincent Jardin wrote:
> From: Vincent Jardin <vjardin@free.fr>
> 
> Factor of pmbus_fault_handler() into an exported helper so
> drivers can notify sequence from a polling work item on boards
> for which the chip's SMBALERT# pin is not wired to the
> CPU. The interrupt handler becomes a thin wrapper.
> 
> Like the SMBALERT# path, the helper notifies and then clears the
> latched faults unconditionally, so a polling caller inherits exactly
> the interrupt semantics.
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Applied.

Thanks,
Guenter
