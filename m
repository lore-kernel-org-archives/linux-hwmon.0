Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87927349AF5
	for <linux-hwmon@vger.kernel.org>; Sat, 13 Jun 2026 12:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781355215; cv=none; b=izCRB6LoKWE0dVu4iBncqzKJBHBZBiJ7xHTPbt8Cerj6kWKJSq+67BVAJEsPWSTQIg/gO7biiPBQKO4bPmc2X21XQDkcgkewCQolQWOQkpivGOHRocJsR9nR+tjNvxxJpNpYFzEH/kyeK1dJVPCaLxjG2l+g0GckYgqjzAVpwz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781355215; c=relaxed/simple;
	bh=Qmaoh7cMVu9tJkXVzwGow7uNL/zo3HDxiNqzrKnMtVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g7ITPuhX0GpOGT+emdSPZ5uRMwP+tPzF3dx31tFnsLAorygEltqktNDmvHHkjKQQqy50CnCqTfr6u5vBKD6El0d2QGk1+LHZR9hZpo4N2ZuUeXSKpjMjKiVQgk00K4E0divmV8oQuc895/lUKHJ3bT3wwY9EjIYgQhjWzM6LFEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X9Hup5qF; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X9Hup5qF"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-304ddfcf72cso2368548eec.0
        for <linux-hwmon@vger.kernel.org>; Sat, 13 Jun 2026 05:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781355214; x=1781960014; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qBCjAX2V4L/uaWLBCzV3ie2sVgYu7csnUlJ3Ol1ET04=;
        b=X9Hup5qFy/je+2XB8tCJ6HpnwZa+ouO4uJxH3bQJJmFHgvl/g4mpGkkNPg/fgyXBmV
         h76lJKClozkm5uwCsSASiBW8HF4Scv0wLSVMLvQBaHsBwqrrDKRwlgS0PWyhDP4sIzuW
         ivUqOu02Do6f1FyWnMe4RI87EP3v3yTxKMWrpje6h2CDdxSDZfo7W/OF3t2coFSdD/dY
         RSNny3xi95q4H0JZfQh4gOgM0NqKoHzliqzB3Xau+xowL83CspiQPgH0aRMv2YFwpJmk
         cbsuZgJM07uTXTB6G7snm3kqikdtyxsLn6E88XtgYLYqz/iXXiLHlm6hqkNpKv0nEhLS
         zW3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781355214; x=1781960014;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qBCjAX2V4L/uaWLBCzV3ie2sVgYu7csnUlJ3Ol1ET04=;
        b=Mx+HhW0+0YsI6pAx2+3huvQITyP7R4pSqqjubK6cqwU/tm2Muw1VgVVWX0y062n39k
         yUyTUqVO+aMjF+03OwFdcBYHzlk5P7xrHmyBgL2GIT98EeOoouRvzzp3Sdnrfv4TBHsb
         D8xwsRD0h8BcD9p5sRWXaby85p3YdeUxXbPhMGM7ty24RhIwIsLzt/hKiZ3zQ6T/cFif
         zks+TWCnhC45OgK5PKhIaXVmv4kZDTnEM51MVmxTGYw9jJeQahRfiN8NS9rY4i8T1FwI
         qUrOu3EhO6RFvNxotsEAdv/YOsattjQYk+0ie0GbNFiIDPp7EAsSu1A4UoGBT6HlxWlg
         ve0w==
X-Gm-Message-State: AOJu0Yyr+HXLWyH8N4xGdqucXOo00BIoZhcvJoZ4bFVRGiBzZixEDHaZ
	e5tGUxlwWCsOh/AWF8OUSFDGSY0uSrzj/sdU4yb01h3lVN3IyBXWaYpsxeFiio8G
X-Gm-Gg: Acq92OHt3eJVjpE8ZRpoJC5eFR4ExhzXaT7vL92EcNT8U7roUb59CiGS3n0dXvJGxOn
	79Cq2VWGo8qSVcF7G0WqBlqLJK/UTtMkne4WoCTdASyniKrVFFeWchjuvgzbEQazB6M8gEo7ONI
	bVoWaPTyltvJcs9FrmtFBzbpZethFtoBRmdiYGaSc0b37FfoSDfrlReFs0DgsMd6zjuatJS42md
	ZCEAx60Va+p720VOeMRZG+cCKEC7HuuR+H7ytndUojbYey64KHsrNqa1a4THB521Jbq5XV1WhAB
	9lwRI6WaQyaoLg542m3P4WiN9JSpg7UAp5YVhJoGIcNP8fHxAlaDG072Jwjol8DXNOxBTbtGzaK
	JGBky5zvWz9z20sc4ctdza0nM9CLEcSalUDlW+9pZBsk9k843ucjUDKolfEwK/dX26SC/1DE+aM
	y7b3n8bCjyekZQI1uw42rvLt1+jo5//vhI5z66
X-Received: by 2002:a05:7300:8191:b0:2d9:6373:ad0a with SMTP id 5a478bee46e88-3081ff7c64amr3566176eec.11.1781355213467;
        Sat, 13 Jun 2026 05:53:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm8191097eec.10.2026.06.13.05.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 05:53:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 13 Jun 2026 05:53:31 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: tmp401: Read "ti,n-factor" as signed
Message-ID: <c5750faa-ff2b-4c42-932c-81ddc67de2e0@roeck-us.net>
References: <20260612215332.1889497-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612215332.1889497-1-robh@kernel.org>

On Fri, Jun 12, 2026 at 04:53:32PM -0500, Rob Herring (Arm) wrote:
> The "ti,n-factor" binding and examples allow negative correction
> values. Reading it as u32 makes the helper type disagree with the
> documented signed value and hides real schema mismatches.
> 
> Use the signed helper so the DT access matches the s32 value stored by
> the driver.
> 
> Assisted-by: Codex:gpt-5-5
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Applied.

Thanks,
Guenter
