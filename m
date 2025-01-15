Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B441DB120;
	Wed, 15 Jan 2025 07:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736926742; cv=none; b=Cmuhz3q4P4ld508wA4YJkgQwTUOC5kiDkEaT+9B8++w0FgsbIUWB9TPne2DI+UTzWuDFXjL3WrCfvpqbfjsqz7VnZ/ysB3w/kAqBCenE3VYdfBQgE0M51IaPLJ7KvSbtdAsI8Yf2n0K0ruBANiVTKpEkGpwFsP90KKDUEmtx1ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736926742; c=relaxed/simple;
	bh=vlIn/J2O84J+JT+1i+wxBYZilBVlfXH9SzN2oCdnoYQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VtnMLWuf3HM8YT9lmUH+MCiD1ZKf+d1j+tZzaIAw0cfTLgDcXfZnakzu0pyDXqEf/9G0OHv50aNF2L99OhcBpWFzbqDeQAliN3fAfNxQo2tz/vDab6q8ke8AIA2l6NBirYUtxbwf3P0jQ2kaooz652PGDdBkNQUyREl7QlKHRjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZUjBN5HP; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZUjBN5HP"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e53ef7462b6so10871323276.3;
        Tue, 14 Jan 2025 23:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736926740; x=1737531540; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vlIn/J2O84J+JT+1i+wxBYZilBVlfXH9SzN2oCdnoYQ=;
        b=ZUjBN5HP5krqJvb4J14OMboDdykSLZNcdej4s0IIyFf2hfFZY9uaHaPTH7N4srBi/m
         1EG/yCT6TuV/dJlfPRgXYFDAvxRqJUnducrpf6m9lOc9e3VS7qvAN3dsyDw91ln4r0OH
         sv87rxO5/Z9dcwi265lZUBGq9bkKOujVXRcb+ZZJrQlZYvvuezGsA4GQ38tba1HYW8MQ
         OAJ7+jg1K4N/H7lxZLzwFKojBIOgxW7ZvWw+8MTAXgdtDr1sH8RMiPuaGjK7TXOMi48g
         SueNyg7tycUmLjtb7e3jJKD1y0qyJDrTFYVGhdDMHAtEVo+g6dJ3yM56a6XlIE9VX1TX
         xp8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736926740; x=1737531540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vlIn/J2O84J+JT+1i+wxBYZilBVlfXH9SzN2oCdnoYQ=;
        b=nafvCmTfEB4G/BdkjxizSaca4BPB9yxLF9NQmKtBKdajKsOUAXRcJWbWmUs48sPKiB
         wItx5974uh8IOYpEe+fdXaUHC7nlD5HfuL5lyB/QT5mkPr8zClBXyFcpZTu2C0VW21pP
         M2iUHNfpZduxTdc+0ApfJXSIuQXDmdzdIV4sxctZp9Ct/n3NYZKouGI+K18NJ5YqED6f
         vjEDeGcwFPEdjyTjY+O6ghlVhc6u5mUckyyS6lRTOtb/yQXWiwuetED8AQJJ2Yhnv0NR
         DEW2SuTLgh444ZHUQfOHccQwvKlEYTXcXfzgZ5ad+ei/svxxhxWqC5l2lc8eY/l9ddeY
         BUDQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4CamBL4E5msicbciLb5JzJk1RLdVUFWJFTtDzExWeciNS8fC5cI3QPN+2uvP9Vr6c0LuGgnGUao6g0/o=@vger.kernel.org, AJvYcCUcxlaJKjbrRhvGzKMvz27aVfRyc7BrQ952zOct8osqPn3sUW2ZV6CJbr0qvtxSrluTCSClJlpYaH4n@vger.kernel.org, AJvYcCXRB0QKT5Zkp+X+nilzPcnnNeogPcBtim87QjhQn1/YaPdHSbEwrZ56Rwq1+GDDSJzd4JN60TfXXzNs@vger.kernel.org, AJvYcCXlHVurpnVwEaYu22OMGHE1kV21yOZZldyUzsCiUm6EbWRdhRQbRcu3lTv8gZ0BO5GM6jSNorN+q2oJjK0C@vger.kernel.org
X-Gm-Message-State: AOJu0YwsHyD2GlqExH0sU63qJbsE22pjvyZ3TeTOBQHy3YNdBtVmU/Ve
	jhrFG0KcVZs2EXwEAYOOhYhugzhLjx8uM3D2A2xrY/AgkXgkkx/2LxSbVZsyfj9/UWCws6Lpuy6
	e7oj6K7rZ2N24G9H6ezdPgg//8m4=
X-Gm-Gg: ASbGnctyOB3HD98Em9Qe7XqFfKwNei8eXdIQOmt2KmyPCTirO0QGq7EFAH+WyAJ8mvi
	bKSCfgXTjXLBQAvmsPh7cxfaLYL7fh65JZ8gSNdzwECIR/O7Za5AsX1wq6R+4NNw7kIdtYv8=
X-Google-Smtp-Source: AGHT+IE9BcvKGqyedFkR4CvXfQ8QyqJE80ahBeEVo5Fo2mopSBp+1+ajEOlnGbRhFY5NfXDR68DQSMb6dA5whY4U+TI=
X-Received: by 2002:a05:6902:1245:b0:e57:3641:7d55 with SMTP id
 3f1490d57ef6-e5736418007mr12996408276.12.1736926739927; Tue, 14 Jan 2025
 23:38:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250110082612.4107571-1-a0282524688@gmail.com>
 <20250110082612.4107571-3-a0282524688@gmail.com> <d83078ac-69b6-400c-b037-cfe00be6251f@kernel.org>
In-Reply-To: <d83078ac-69b6-400c-b037-cfe00be6251f@kernel.org>
From: Ming Yu <a0282524688@gmail.com>
Date: Wed, 15 Jan 2025 15:38:48 +0800
X-Gm-Features: AbW1kvYlhRS_VNzoHXzQLpg5Pge6OdVxv7WSXP09DLW6q9owLFMP9YxG6W5-OKw
Message-ID: <CAOoeyxXQJ1U3Uh=G=T+e2dZRk20WeNvkf8Df30R9rGeEV+zEag@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] dt-bindings: hwmon: Add support for NCT7716,
 NCT7717 and NCT7718 in lm90
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: tmyu0@nuvoton.com, jdelvare@suse.com, linux@roeck-us.net, corbet@lwn.net, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Krzysztof,

Thank you for reviewing.
I will include hardware description to commit message in the next patch.


Best regards,
Ming.

Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2025=E5=B9=B41=E6=9C=8810=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=885:29=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On 10/01/2025 09:26, Ming Yu wrote:
> > This will allow binding the driver with the device from the device tree=
.
>
> Rather explain the hardware, because above is not really correct - this
> patch does not allow that.
>
> Anyway:
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Best regards,
> Krzysztof
