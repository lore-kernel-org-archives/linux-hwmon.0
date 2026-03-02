Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3846437C0F8
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Mar 2026 10:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772445634; cv=none; b=tHMkizl01uEGI+gKGepWwUAiQXfIdnNNvhH+FwzwuA7YPcETzP7kgq1v3KBiK0IzwjgxQHskb2Vg2KRgUCmH7ShfXtizBZGzLfojrh0OZyJBNktbgT8SfOv1QBFxAVgfNnXDANLArsiWE/zX81aBXvSgskkYtmZw40e5AFZtJ64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772445634; c=relaxed/simple;
	bh=4y2TOHi9TFOVkbjGDV689T/Smv9dTsRouELeh2CzMQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jqJyiigg2wZOZ2p0L6xFFc0e7d1Ki0mXasngn1RTTs6Q+OIsw+WYNNSkKdRFjkyP4TeHGlser9W8S9kqA22wk885jgmLfL07o3l5/geG/6bfqkBJ2BVxx3AUHKBtfEn5RUfSbfpL7BCKqUVKklTS5OUgbrzM5A02gCU8Tf+2VuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-944168e8c5fso2442766241.2
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Mar 2026 02:00:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772445632; x=1773050432;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k8HkRe6vR1zoQp8bGRDh2bo/ApHTR7KmRx9+/JW4v6E=;
        b=E6Eo1LE6ySghNkPn0YxrV8F2ut73vc4DE84HdQGzAA31QX5CF1IegqANywwe+wXpBR
         /wLOuq0WuD80A6Lqr9nK/jrj5Rf7HXeIsKHaC6u+ynMLgWz1i77NVsrS62qufPS3D2IM
         i53pWujBABoEDMafpLYi0NebYX0pL6Tkokq+ZYGD3te06hKdPa+WuNBfhh83iwUMgg9/
         l9igwMzT7OvW06Kd/sr0w+kx0Q8ZXYdCsXtrPRhzlFjch5L3m9qEw941+mueKO+CdDvo
         ecMc+5HOvB6DiZXMhN8IAoj1VISHehkH2PiTZE00vnDGkRO24kMGpniduPswsS/ZiUmy
         QANA==
X-Forwarded-Encrypted: i=1; AJvYcCWpBpcOWHRNRoT5XK57wk32ENaNLABvLOZBEUSBDz54ztDWi2DhYYajdGJbtSuXwukjrElD3V276146Qw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcfNrde+tYDwDi5SDWkQmyRILw9/p26UDZJ65NEXX78Z2nIzm0
	WqcJ86GZBQpLYwGBxnxb0R4z/oBBmH2vNtYC9ba2P1Qqbf6MQ51L2U6Zv0XYZnO4
X-Gm-Gg: ATEYQzxdS8VSaGODQKoCxmuOT3zU3tMkrA4J7cgz3YpYOKFejW0UKjzkFE8GPGUdF4D
	5QoTojBQ6xxd+zUZTr1ce6hJE9irlB3EfhphWJrsQ22SR2VD6DNzV/ZkTe/JT0mSoCHBleDaEQk
	tPxFBG+3PdqAV3BuxL3wf6DzucrDNYAWClQ0JmATM+uGk6R/q68IreoZZPqqXKsICNQHtivOSmL
	OTJ14RSK+s6vmU1033fij/HHLr4o/7MOzPJNYjaT2QXchPxiu3outHEEQOcnv848wJPjMJNgxsm
	9dt23q4Qrv8MtgeX4ik9OKWXU0w1qGVa1xMKqfEWljYvtFYvYDCcEAkSsWu9ZdbAGcg51V9bQIE
	5KvS96TmwV1GVUchRaBVkX3EK2cfV3HwT928LqeBHzaGUh75qhAptXvzPAerLbo6ScHE8WV3fC0
	fxpbuWDn/JZ1dy0Zf4+HZHEPRhwTGoM74M7VtDgUezHXcOEPHUayT45CjUsQdz5isz
X-Received: by 2002:a05:6102:c09:b0:5db:e77e:7828 with SMTP id ada2fe7eead31-5ff32311c24mr5929875137.16.1772445632097;
        Mon, 02 Mar 2026 02:00:32 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ff663d81c7sm3192868137.6.2026.03.02.02.00.31
        for <linux-hwmon@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 02:00:31 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56a86f0a23bso3597875e0c.0
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Mar 2026 02:00:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXO6ZzMfYPZg9iLIWSc8yCd8dhe86L8xWwSDDdRAQ/pOc5sdDvzO3WkNxU5fDmklLT3NPiDWxmIGQ7HtA==@vger.kernel.org
X-Received: by 2002:a05:6122:1c0f:b0:566:22e6:35df with SMTP id
 71dfb90a1353d-56aa09f82acmr5754346e0c.5.1772445631307; Mon, 02 Mar 2026
 02:00:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302002729.19438-1-dakr@kernel.org> <20260302002729.19438-2-dakr@kernel.org>
In-Reply-To: <20260302002729.19438-2-dakr@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Mar 2026 11:00:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUi3uNoDJ67WkNSKn=BD1F7D1Ot=gz4TwFPvaaYmKaNcg@mail.gmail.com>
X-Gm-Features: AaiRm52H_j84TKaKZyu39pwrVpDQPCGWPfmBnPTyHzO3FAF2JqSLhA9oDdBhutg
Message-ID: <CAMuHMdUi3uNoDJ67WkNSKn=BD1F7D1Ot=gz4TwFPvaaYmKaNcg@mail.gmail.com>
Subject: Re: [PATCH 1/3] driver core: generalize driver_override in struct device
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, hanguidong02@gmail.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	abelvesa@kernel.org, srini@kernel.org, s.nawrocki@samsung.com, 
	nuno.sa@analog.com, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sh@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Danilo,

On Mon, 2 Mar 2026 at 01:28, Danilo Krummrich <dakr@kernel.org> wrote:
> Currently, there are 12 busses (including platform and PCI) that
> duplicate the driver_override logic for their individual devices.
>
> All of them seem to be prone to the bug described in [1].
>
> While this could be solved for every bus individually using a separate
> lock, solving this in the driver-core generically results in less (and
> cleaner) changes overall.
>
> Thus, move driver_override to struct device, provide corresponding
> accessors for busses and handle locking with a separate lock internally.
>
> In particular, add device_set_driver_override(),
> device_has_driver_override(), device_match_driver_override() and a
> helper, DEVICE_ATTR_DRIVER_OVERRIDE(), to declare the corresponding
> sysfs store() and show() callbacks.
>
> Until all busses have migrated, keep driver_set_override() in place.
>
> Note that we can't use the device lock for the reasons described in [2].
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=220789 [1]
> Link: https://lore.kernel.org/driver-core/DGRGTIRHA62X.3RY09D9SOK77P@kernel.org/ [2]
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Thanks for your patch!

> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -381,6 +381,66 @@ static void __exit deferred_probe_exit(void)
>  }
>  __exitcall(deferred_probe_exit);
>
> +int __device_set_driver_override(struct device *dev, const char *s, size_t len)
> +{
> +       const char *new, *old;
> +       char *cp;
> +
> +       if (!s)
> +               return -EINVAL;
> +
> +       /*
> +        * The stored value will be used in sysfs show callback (sysfs_emit()),
> +        * which has a length limit of PAGE_SIZE and adds a trailing newline.
> +        * Thus we can store one character less to avoid truncation during sysfs
> +        * show.
> +        */
> +       if (len >= (PAGE_SIZE - 1))
> +               return -EINVAL;
> +
> +       /*
> +        * Compute the real length of the string in case userspace sends us a
> +        * bunch of \0 characters like python likes to do.
> +        */
> +       len = strlen(s);
> +

The newline case below is is basically the same case as the empty
string.  Hence if you would move the newline check here:

    if (len) {
            cp = strnchr(s, len, '\n');
            if (cp)
                    len = cp - s;
    }

then the "cp != s" check below is no longer needed.

> +       if (!len) {
> +               /* Empty string passed - clear override */
> +               spin_lock(&dev->driver_override.lock);
> +               old = dev->driver_override.name;
> +               dev->driver_override.name = NULL;
> +               spin_unlock(&dev->driver_override.lock);
> +               kfree(old);
> +
> +               return 0;
> +       }

Also, this block can be eliminated completely...

> +
> +       cp = strnchr(s, len, '\n');
> +       if (cp)
> +               len = cp - s;
> +
> +       new = kstrndup(s, len, GFP_KERNEL);
> +       if (!new)
> +               return -ENOMEM;

... by pre-initializing new to NULL, and making the allocation of new
conditional on len being non-zero.

> +
> +       spin_lock(&dev->driver_override.lock);
> +       old = dev->driver_override.name;
> +       if (cp != s) {
> +               dev->driver_override.name = new;
> +               spin_unlock(&dev->driver_override.lock);
> +       } else {
> +               /* "\n" passed - clear override */
> +               dev->driver_override.name = NULL;
> +               spin_unlock(&dev->driver_override.lock);
> +
> +               kfree(new);
> +       }
> +       kfree(old);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(__device_set_driver_override);
> +
>  /**
>   * device_is_bound() - Check if device is bound to a driver
>   * @dev: device to check

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
