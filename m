Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B378472618
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 00:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785200335; cv=none; b=Yvz1sYz1gjYM+BeS9Sa8EwxeFUzCfjc9HOWfTaauvqvk2zaVCetqfZxfR6ufm+RzBcv6wIwtofCxt83W9I1gEurfCAOby03J7OiJVA/04hTqU42zO903d/heRTBrniKTGKh3JAFMJxhuriWrKFYVAIw/g6fiN4zxvhwIww/Kz+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785200335; c=relaxed/simple;
	bh=1OlPecOfu6v8K9Ve2xwq2352apYl+EWa8UyNEtduENY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mty98tSj7KJfNiHxh9BvNi1m68BBI7AC6399Lhktf9uyttaBAKlM2yDuXHmWjE9WjubgxQISL9WpmllBVXAoIZ6zA2+2bce4o/0FqGxQ994jKD5qHNQRVOsLLJXd36OimsqXw97UFXkUB/IzyUDykrM7pqGvWqxhemMbEA0jwLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G1XuIQz/; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G1XuIQz/"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ce7d2adef4so39864645ad.3
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 17:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785200334; x=1785805134; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xy/iZ3fATfSJev5HQVXkfCvi36PKh125qsWkh9WHvVs=;
        b=G1XuIQz/vPAY9Bhyk5AdYjSCqoLDoy4iSwo2aez8qU3M4W2q1GzQttMg0yQ5hUQ3h3
         iaPZY5kYm9EtUvit+4hfUIXgnOEjPhzA5ATtDEm57nC9nqOzcW8yaV4SCtG0dJjza9rC
         JrMD1mm8desEMHe9rd7lwaVnfG/lF9OpTEz7GNgUvsiVeB3EcC6O7sWVxu9Rr9HUQfAD
         fi0fGkzRNToboW0BEXJOP3cKbpPvRoDI+iGCL79aAe+LXnuh7gZpw5TIQjQTBU+aPrp+
         4ocI3AwJ8ea9LiElksoRuu6JuHwGYMd+avx6bG60ieaSrkkNkHhVxgh8bHW5eqcXeXuQ
         4+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785200334; x=1785805134;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xy/iZ3fATfSJev5HQVXkfCvi36PKh125qsWkh9WHvVs=;
        b=r+Kw/NQ1UwPrAH7RmRKlaVy5wadSpl4L/hg5TRecsCqHI26cnNzM0CvbMUIMfo2aV4
         +Bzdu8K66JEgr87cfaSapLMjCDmHUtbfj3AC0tNJeMdiCZyGRe3xOmofhSfSonywm5Xx
         dTupKWmHZuiQzY8zb+94+45/ERM8ftBCDYGQxpvZucSXCskH5rXwNgLMtK9XJpaOgnoW
         Ssc9x4ZOnZ1tZTtHKfZlQ3AfMGk81ivnIKOWUh4LdsTWuxpIAiymzwv/f06h9XNKCer7
         Jf2KFjP2zTaVfF80+rXcoRnoUPF+VbpjJmaBGzxChhL88tnD7BD5vzRkbVrQpCCG2AF+
         L4gw==
X-Forwarded-Encrypted: i=1; AHgh+RpZWGyEy6eZvqsjAtMbpPK20VDBxGk1E47M0SJR6YBpt9zJPTjkpL0mucUa12qsstuFLg3ekPFcX1FXKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwN9hYKjONzEdn7ncxJljog4QB68c8/wLMe2Ctnk4ts07Ua1csO
	e5jwbQGAOzIdDOTJLzCJbHPvjGMO6l4RCAlb1TH6UcaB/USqvKphgDHN
X-Gm-Gg: AR+sD12uCk9MPy673Prvc9grSwoz0gOt9UkzH4EoTobl3nc0SQx0Ppuq89brNlTN4Qw
	QeVUe0yvECN3Des3i+OVfGU1dmvrhkbQQUPu3c7Loj3AfY1jziYmAJNs9OMiXl9pC28jq0kYJuc
	zTpE4K7EmLOdpanmtV5SG+n9tGqbbfUG8PYGzfeeTUzcNOWXG8d3nalRmDb4tYTC9GraP+x0Mh6
	TrTiGBnMlMtFINJELa/FENZmkKFMJ/IUR51n0gNu996s7ZJs0ROjU3mAfAnGPUxA+A3GaovbGLy
	rD6kBO16DJdgGHc/cc3ubvCcvlj+RB/nSQDggn6qLjVgS1GV0Sg9n3f4XAVE3+o563muqkgj4xS
	+B3sICTGbaD1DVFTO9WgheQcN874oDFPXVRxbWdE5/e2pnF75J2GVsxU53OqAn30exUEajcUKFK
	4Xud2oSeWS652cAh8=
X-Received: by 2002:a17:902:ce11:b0:2c9:e5ff:995d with SMTP id d9443c01a7336-2d015f01e44mr2099365ad.31.1785200334150;
        Mon, 27 Jul 2026 17:58:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde80f50asm42323835ad.77.2026.07.27.17.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 17:58:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 27 Jul 2026 17:58:52 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Darrick J. Wong" <djwong@us.ibm.com>,
	"Mark M. Hoffman" <mhoffman@lightlink.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	sashiko-bot@kernel.org
Subject: Re: [hwmon PATCH v2 8/8] hwmon: (adt7470) Fix PWM auto temp state
 array and bounds check
Message-ID: <8566be91-55b5-4569-ac90-b9ba097f3092@roeck-us.net>
References: <20260727-adt7470_fixes-v2-0-598e38a46ba6@gmail.com>
 <20260727-adt7470_fixes-v2-8-598e38a46ba6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727-adt7470_fixes-v2-8-598e38a46ba6@gmail.com>

On Mon, Jul 27, 2026 at 09:22:24PM -0300, Luiz Angelo Daros de Luca wrote:
> In pwm_auto_temp_store(), the parsed user input was missing bounds
> checks, allowing values > 0xF to overflow into the adjacent channel's
> bits. Furthermore, the value was being incorrectly written to the
> pwm_automatic state array instead of pwm_auto_temp.
> 
> Fix this by rejecting values > 0xF with -EINVAL, and assigning the
> value to the correct array only after a successful I2C write.
> 
> Reported-by: sashiko-bot@kernel.org
> Closes: https://lore.kernel.org/all/20260727034932.0B7C41F000E9@smtp.kernel.org/#t
> Fixes: 6f9703d0be16 ("hwmon: add support for adt7470")
> Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>

Applied.

Thanks,
Guenter
