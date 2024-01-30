Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F1C67E98
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Jan 2024 11:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706615212; cv=none; b=rknU46dKXXZo/CGSKkNoNXBndIn8VAvJlWxvkYgIVoN7iuxOc+e/k/uqiF6Zh9VKQOvYrG2QLGyBGRLA1vtgFN5HNQMd9RsGGLPn68cZDcOu0cjjqnlaMJPKcLijsLdzmsRRlRwQV+A6Fi5nBVZKmqzU1VrpctXcwMKFw0uPU+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706615212; c=relaxed/simple;
	bh=y5fKmR83px8Y/ZQgyh2eeFCI3oTRb5BOV/892hDJJd0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=mXB1uEI6rlDnu8sN5Gksl++77HWpOz3FFVo1xoHX8wOFOU2ZLil9zacTjwPErQOuTRttgfAUt/t9Z7eU99BtkTguve21DR1mHcBNDEKlpdsIIf3GFnEVCsvFUn6Stg08ClOY0GTopvvdpBbGD/2MIPYSjKmrYl59cYwk1Bm+EhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nLE+5lR+; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nLE+5lR+"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-33ae7ae1c32so1674841f8f.3
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Jan 2024 03:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706615209; x=1707220009; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y5fKmR83px8Y/ZQgyh2eeFCI3oTRb5BOV/892hDJJd0=;
        b=nLE+5lR++Suf3YWLZPjqFA539b5roz54NtwkMxb6v78sYwo3rwoCQq1HcGe0IVvhFS
         0A0T2Oq3rDRZEh2VcN8pUYdLNaDg4fGfdl0Rem6tRjQ/XCB/b4oYryw7LbFtTaJJOm+y
         GIA/IIvtwmddgSsxL7T+5HqVpp6U8ywYMY636Q5OupQ/zG1/9pmkP5TH1Yp9vjN8zxRt
         WLVNfhUjLCZMRrnjPA9hc4cl19ULduIJJ4goxJ8ixqmB6mSOr/fqTZWhgEd1aXxXq2+X
         53HLsLF7eztxKGe4altqXZJnVqg8cVHH5lGb78Cscb+aknVU1map1+A3zTbdMiwcRx5S
         1Dmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706615209; x=1707220009;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y5fKmR83px8Y/ZQgyh2eeFCI3oTRb5BOV/892hDJJd0=;
        b=aq80zIvVsLEAXloyeIi320bXepu8MbvS0EnbCKC2mfyJWxMHh8ZGiyD1y8EUY7cWhL
         XaK1xJ0M7jkOBqwyPl+jdmu7EO4uxxYopRcVxAH3Ff57FXUtC7zcuUVF7TVvbeWha5BF
         FIFeTAfQorTioHevU/QaG/Ipk37WiQ7HsDkn8aYqYuT3XGXRErwTdJXt7nhmpjnS4Qhr
         TKe5bd9yUDfx7VbIs+4b668U/+DvSHtaxYhMiamE+z9B/3mxcFGuAyOYXIXv7z43Ga9A
         B11druzNsTF1Fbr0WKPpo0PjLd3kn4D7AOs3NckgU7+RCXXMDdd2YwO6A2BRzu6V0Jcr
         1TPw==
X-Gm-Message-State: AOJu0YyKc+L1VemvwSz6dboc1+1UIyl2+47aCjtsOPjy9BxD97L+iNfx
	rUjCvQwYfydC35UuWt/mQBxnchebusYADHraEv+/aQ+bK5gD1TN+bxF6EIJkdi48lOZMql7uoj+
	Rzq3aB8xz5iEqaIhrkXGXtV0LNR5Sf0ONW4CZdBqB2AaSJpF8Kkc=
X-Google-Smtp-Source: AGHT+IHi+jJFXHQck7L3PXGqggm6BkPEbCGQDwK3j+agUVPV/UfUUzL8IeeC79NrzRtuqCdP5E8hX9zzcKjxJFNJioU=
X-Received: by 2002:adf:d1e6:0:b0:33a:fd45:341 with SMTP id
 g6-20020adfd1e6000000b0033afd450341mr688073wrd.30.1706615208973; Tue, 30 Jan
 2024 03:46:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Sahaj Sarup <sahaj.sarup@linaro.org>
Date: Tue, 30 Jan 2024 17:16:37 +0530
Message-ID: <CAKZ1LvMMri3dVKxGDCY5mkXKA1evkOaD4dGF02A9qYdbiWMp7Q@mail.gmail.com>
Subject: Clarification on shunt-resistor value for ina219
To: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I had a quick question about the ina219 driver

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml

Is the devictree expecting the shunt-resistor value that is actually
on the PCB or is it some calculation based on the calibration value
being a static 4096?

I am confused because of this comment in the driver

```
In order to keep calibration register value fixed, the product of
current_lsb and shunt_resistor should also be fixed and equal to
shunt_voltage_lsb = 1 / shunt_div multiplied by 10^9 in order to keep
the scale.
```

I am seeing a bit of deviation with a 13 mOhm shunt at 12v 3A, I am
getting a reading of 3.14 A from the ina219.

Thanks,
Sahaj
