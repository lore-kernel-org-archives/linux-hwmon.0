Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB22F2F690F
	for <linux-hwmon@vger.kernel.org>; Tue,  7 Apr 2026 10:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557540; cv=pass; b=XOe5hkH+HJLJLAnblf7Er8UozBkcC3EA3nGqJXF7dzCoTMiSY6uXJxc3Yyi9mEPcSEoqqtkrj7JpyNPyKCDIYZ+djAenXSWCYUKM445hf7S2tpWBVtSsREJ8yF4N62cqoZjbKg9BrO6UiPKog0Y8+KbG13TYCpATriZPrCe89T4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557540; c=relaxed/simple;
	bh=UaOxwYAmcVziT805AELn5Q3T2CtKIxkSTgQsvQ/cWdU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iA+tGLUjwyLE8uAS4wliIXwcva0sO9z3n7op77OwwX9yvkbwfV+wOytb8JTlOXoIoHlxWhSHi8IxEprvIiKDrQ57PhRrldK2VdhvlktG+5py3Js7X5b2Svbjc80OMS7RnJOMqeN4AKwsrCPZRJHTfptv51/wjPy+DDA0OPaNmQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VTop/QZ9; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VTop/QZ9"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso3434601eec.0
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Apr 2026 03:25:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775557538; cv=none;
        d=google.com; s=arc-20240605;
        b=ioMCo8hnlwpc6nUMGtxBX0ih/dOWYnPDTJ2qhPHoD76BYiMWNIWlQL/MOrZW8Y30wy
         AfPyHaKDAJGCsD8HxIkLU2Dwq26XOMCb3g7eWVJ/B64UJZKHaIYWdStcQ3VuLZcBfRsf
         kq5yKaa3aF43q7fSO1aet8rdwo/ClbG9PcBiFztwnzmHiGyoP0tdr0VXaHIDUUCApyxh
         kxQeG4lbxo9lSwryHj45bHKXT6Ksmxv/U9nYHCw7hyN512tCQmLkgHLg6LZLPZTqEDUn
         pDzT5uGbSAu226BdqcENZg77J4g5ejPLPuAces6qVo/6jjWg2nX3t+DbSw2X4DvgKode
         2OoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2dCoQ7CeEcgKj6hOpXA6YIiqhgwa4zuY4BYRg3RTjGo=;
        fh=fn0xFEXlmOejbLIUhpX6p/P71Dz89HDG2jgBe3bybEE=;
        b=HXTQHDlVWCusfAyVELySqsgvkk3ksbeyrzCznuQKIsimHbPdufwb8sWhE3ENn09DRY
         yuHZyspwOOrAQzXWTnJVhuW9htuVzxlmWoFIFFQWI5xGeiGDzJsIaQzDvmaie+pKGUgA
         /qxE5g//DNGZkVrNPfZ4cvU1TUSs1ZA4bEEzLs5thwRs3XCT2SxoqUFqby4oUiUHJvt3
         cmRh4VE+ySAI+GWMNcdP+RJDPW/nJSHyKL2x/xlTFGZBP9/e/fGcqp99CUpF4u+ajBNN
         8dhTvNhXCJZF3GPOyMS0YcpIoE/A3FuUYsLOoDAIQ+DBaG4Aer25XQ5MKToViMKmL6uB
         A5kQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775557538; x=1776162338; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2dCoQ7CeEcgKj6hOpXA6YIiqhgwa4zuY4BYRg3RTjGo=;
        b=VTop/QZ9+yG9NhLIHyyXnmtILbV50A1Jp0+T1fNXB3m1xvLsRcRHgItb1VHJD2Eser
         cLPWXviQXkRggOF07QXN7sMkl+6BVilYqJIU21HP5PZDWwxFWuc3mWUJm3GFYiqJmjMX
         1Cr7s9HuXsAht5gqQTMkTJXCJLxHae/9reEhWjQQbSZSpUUGhW+aS/hm5CiUGDquN2lZ
         7XH4cev0DWyvEcSfj8dZVGG7ph3GNIA7GVgwk8OhyIhxpWjdHorbQ96VBiHlGSflR+hP
         c65xkafic3Z+RBxhDgOBZpk8Rgv8G/sPIBEGoBiic2SHnA7PdLjukzIFeBrWpkg7kqwx
         mHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775557538; x=1776162338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2dCoQ7CeEcgKj6hOpXA6YIiqhgwa4zuY4BYRg3RTjGo=;
        b=AyvE+Pkn91/46a8tzqCC2FDYcfZJ5JsGAJmC9kpsuILSMIyq+xmDXNsLjf2RV9s345
         BmXJ/QLmJi8CupcJqJccgVNyVj+HAproJlqCzzfdJtZJubvFG2yK4jr98tn8MLTozk/X
         zjoL/U6bSDncD4c1cvT33zFiov6KHts2dWfrZ+SJSx5twlm4cO+KXqCYXMrwniU6oyi/
         dzeaOiSpaWMBUu+A9rabsgCB+vFJ/K4vbkO7pfvNDoi8kbM9veZhF9RJ5CeXZvIVcfgj
         w4MYl9qZ9me0hJ0IiIpX5/ICcKWsja15BO+kIBMACvvM7gnWh7po1pLI8bUGxh7sGh3w
         bpew==
X-Forwarded-Encrypted: i=1; AJvYcCUG1g1VGZySoYGP7h8xhvXq3UjPNOYfqq8rd0cFWjm+8XB1aqeYlh4WSYqCrH7jeJdk+FRDAyxYkVg0fQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGMlU4a5XSfzWpfx9ZCoL74kDLFHUdIO8p1C7X0ieKJP/fGne1
	Se9DTh28jECBoxep7zmP/+btkbxugH9gHpGd4pnO8tD60RGmbRQnw8tm4FxTanoTFMlYcEGjzyg
	BCAhygTa/9xGHY6pevVeLE1D3y7T5fs4=
X-Gm-Gg: AeBDieuYDuXPoKCOP4EByskYYjAZd8TgsWN6CnVxmHPM7/29Iyj7UQ9YG5URRhJZZpy
	/7vX96uqtn+kNNxxfhkBntf4Ju9eoSK1UYVkQEwOf+0lW4FlJnRtKDGsRtQVdLoWjhnywyhvszU
	L4LCjDik62YCNg+wI2CEPJGFn2U4OhAfluGQcYhPQa4tFT1UivkhqMPeIWmwkQDCOe9qrwWuio2
	aFaiB1ECibzNd2rmNeU34ZvRWlEt5kjrn9wSyFhTK/ysdQ11but2PLlz0Rgh0w1alyhSkVwCtzm
	VFH+7hxI
X-Received: by 2002:a05:7300:f48a:b0:2d1:e90c:f58c with SMTP id
 5a478bee46e88-2d1e90cf74amr459729eec.20.1775557538054; Tue, 07 Apr 2026
 03:25:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260406101647.109667-1-Ashish.Yadav@infineon.com>
 <20260406101647.109667-2-Ashish.Yadav@infineon.com> <20260407-monumental-mastiff-of-sunshine-fb27ab@quoll>
In-Reply-To: <20260407-monumental-mastiff-of-sunshine-fb27ab@quoll>
From: ashish yadav <ashishyadav78@gmail.com>
Date: Tue, 7 Apr 2026 15:55:26 +0530
X-Gm-Features: AQROBzDY-4Odb8obalVxjmoVsnh9nWzEPYvrrxsVA9wqCy5mzXHo_vJdL7rCEoM
Message-ID: <CAJKbuCbsBOO1m7ByWJpv=6gy_Sh5Giaoffb-69RFVxr-2VdWgA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon/pmbus: Add Infineon XDP720
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ashish Yadav <ashish.yadav@infineon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Thanks for your time and valuable feedback.
 ACK.
 I will make commit information simple in the next version of patch.

 Please let me know in case any more steps are required for vdd-vin-supply.
 I will take care of the same in the next  version of patch.

With Best Regards,
  Ashish Yadav


On Tue, Apr 7, 2026 at 12:30=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Mon, Apr 06, 2026 at 03:46:46PM +0530, ASHISH YADAV wrote:
> > From: Ashish Yadav <ashish.yadav@infineon.com>
> >
> > Add documentation for the device tree binding of the XDP720 eFuse.
> > This patch introduces a YAML schema describing the required and optiona=
l
>
> Redundant parts was supposed to go to /dev/null.
>
> You already said this in the first sentence.
>
> Also, there is no such thing as YAML schema.
>
>
> > properties for the XDP720 eFuse device node. It includes details on the
> > compatible string, register mapping,supply and rimon-micro-ohms(RIMON).
>
> So nothing here is useful - nothing explains the hardware, so drop all
> this and keep only first sentence. Or say something useful about
> hardware.
>
> >
> > Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
> > ---
>
> Best regards,
> Krzysztof
>
