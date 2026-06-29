Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0A337DAAA
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 20:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782766144; cv=none; b=Pb7i1hTv8wFRDnquKGiPAOILTCRp/T1OHVwNrfb7ZcGcOcPJlqS2SBoE/mV+uPbPG4fE+WivRlAmwrOYCvQeW9j8blbzArQq1zCLve4iab754NsxxbTnTCY9ec877/mt5Z53CFVsUrE7BAdHnhcYfgLwKX3odA3adiFVWVZLzeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782766144; c=relaxed/simple;
	bh=rwJU3WYOnqf0gEpLs11o/YLJOMO9LRJt51RJ0YywOlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ppFVD1DuRWutCHDkzKAuG9Pgwzv+VHz7KrDDocibSi1f7IJPm9+5AUVa6xUE4bGK6Zpotc+lU8+UpiQ8y6cyjeJzn0LY8+7EYwjaFWi6of0/gzPLQnWc2Y5vxKb6KUxbTWVSPgJZVicbccUz5wTVJOE7O7zU/uz7AnDGPzosYxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LbQktx23; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LbQktx23"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-139edc6bfc0so6969646c88.1
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 13:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782766142; x=1783370942; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hPnhh7jgS4UPbJkDdwhyat1goHs+cg4UMrEmlJGrCmA=;
        b=LbQktx235j+Y5OYmup4u3Cn8q4Q6rwY2SfV1EZ2sR8+7BlE2O7MasBNZwNppLTRrZ6
         kB+gAv3QflpBskQAppLEVLQ/goPR1D7GVzVBq+9HdNUrRDlW+4E/0SO8f+W1FjG1FCEI
         9h20RRqd3KTNxeKkbTu/QX8yC3MRC8Q36OWLDv45JqEUGlJp8tPO87J+cJR8wPJA9AEw
         O4JpS6ym3fMo/xrbac4Zi0z4nzrR9jnGhaUeDdveNP4ecL65ZZwlXu+W9xkfEIpLk1uO
         qWI04QhxgmsOMGszFNCgqwIABvTY4UHhSShIl0X1XKTzLxEgUvgW8j3o6J8IuTwyklA2
         bVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782766142; x=1783370942;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hPnhh7jgS4UPbJkDdwhyat1goHs+cg4UMrEmlJGrCmA=;
        b=Nwv0zkGc/r26KaMCzHanACv6+0HRrLAIkeh0vWR6dBm7EScp9oaSATEULHLC4opORv
         OsvpreWjGgMUA3nM6Zf1dbFAxEhWPnvaMYtKj1RyqU2oDhIPwmSQHJTI/nffw3scYA6H
         v9tIV55Wcocgpcj3DdP4sm1KFyDx/gAyzBnyAhvpwiWXDMi6e7a5fsqm4zxXb/av9wWr
         H5sTB7ietP/yUTvHxrTCDUlHhM/1YclAapeZtAYZZaGFzNB5YsRdpj4Bo6hT8tETINIw
         TdHc+2xN+/XyRuKxuCyUKkJNdFtDFbQZ+F5HKFhkiv5ZyULk7GL7tUeWlrtRoL+aROct
         GtGw==
X-Forwarded-Encrypted: i=1; AFNElJ/Xb/fBTiyZFu1iA79HIbwoVAUlzI1PAUd6iTFRQaqYmrfsSH2kpidbiG17asHp9E/FGG3e4nCJ8Jbhlw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1IBTB2frZU3OGgYvduIqgEBDhamvaJw798hvTTWBqYDhkbOMz
	DNDyQLzDwnx9ttv7iXcnJ38g9+zSZ+Ay+XkcChPb0LUImZh4ZdHsBKrk
X-Gm-Gg: AfdE7cl/fV5JTKXlUD40Maw5o05GvA0mtkdGWxGD/DurGn2qbJ0AFkTzVqicVxp6RmV
	tIrDuUGwZqKWZCy8+5WwVFnAeB3tewP+c79OrcgrtuSAC6aKQNLw9qgUtfOygYDyqfKL0QyFH8K
	9//hue/clkKmJ0O4dhP+p0mX8W4E9u3bUKOCSAecM8LfpU7xuB8knTGGfHnxqYEiJ+EKk3PQHxy
	ST1kjvvuEiHKv/uoHqC3nt0xwVd/el12+Rmmyw+MSWv5zuewewTM5p28BkTs/EID4nB33a/uU/k
	fFTU4AKPqIXWejLTKgxw+iV7ixAV8k4hWLikj70yjQb/DU2LUMDUFgXN0s3IdLHfv6Pll3ZltnI
	JcIUzxezkrgXDeglGkp3eTZ5QgGEz7NUowFCGCta/vTHQ1h10tRoijtgWM18ws8dftEvV/HcJQY
	kK3CNe3hq6qMi02SBKy4e1RH5xFg==
X-Received: by 2002:a05:7022:ea30:b0:139:ba7d:84a7 with SMTP id a92af1059eb24-13b2a1665b5mr614140c88.13.1782766142434;
        Mon, 29 Jun 2026 13:49:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2ab0fc3fsm1198786c88.2.2026.06.29.13.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 13:49:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 29 Jun 2026 13:49:01 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <matti.vaittinen@linux.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Wensheng Wang <wenswang@yeah.net>,
	Ashish Yadav <ashish.yadav@infineon.com>,
	Vasileios Amoiridis <vasileios.amoiridis@cern.ch>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	ChiShih Tsai <tomtsai764@gmail.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Robert Coulson <robert.coulson@ericsson.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 4/9] hwmon: adm1275: Support module auto-loading
Message-ID: <87afc89f-f87d-4d83-9b14-1d34af73181a@roeck-us.net>
References: <cover.1782458224.git.mazziesaccount@gmail.com>
 <9eca6831f9fe2d781bb88337397c39b10e36f5c6.1782458224.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9eca6831f9fe2d781bb88337397c39b10e36f5c6.1782458224.git.mazziesaccount@gmail.com>

On Fri, Jun 26, 2026 at 10:24:21AM +0300, Matti Vaittinen wrote:
> From: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> Populating the i2c_device_id -table is not enough to make the
> driver module automatically load when device-tree node for the
> power-monitor is parsed at boot.
> 
> Adding the of_device_id tables causes the driver module to be
> automatically load at boot. Testing has been done with rather old Debian
> system.
> 
> When inspecting the generated module-aliases with the insmod, following
> entries seem to be the difference:
> 
> alias:          of:N*T*Cadi,adm1075C*
> alias:          of:N*T*Cadi,adm1075
> 
> I suspect these are required for the module loading to work.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

Applied.

Thanks,
Guenter
