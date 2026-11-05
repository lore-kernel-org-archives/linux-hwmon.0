Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872930;
	b=BTY89X//9zAsTR0BR9Ek5tn6xwLk8HWG2lxSvJuC9DiLRk0cRzwv1iqHMKTKoIQbGrS4
	 sGKfrpSGU9ri9cd+grXXNfhX+UD8a6boASpG9vC3zFYUN5hKkufvoQIYWy5ivFJo51nqV
	 oMsoSpuMBhtbENf2rf2cEnD6Rb0z6efkQr1QERESLe3pkEa40/Dg150LLoQhqB3Eli9+I
	 zUeniEyFmsjV4DGPx4a1fP9SSjdAx8Kz5RA/1/VIQNgJeVq/PqseTt0pgj3cRaP3+jmTf
	 3BN1CdIPcKIk//sryoXb9qOh5/WzTQ6tkz4hycMIvwgaN6vg+CaDRTqVQASUIE1dEag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872930;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=LrgDMUrSYXpYgkAhfsYKg0ebb/uLgOfOMhqzX4yL0j4=;
	b=W9vnvhPgqdPwt0Rs7d0s1NpbEan/G8Zy85MTIgLoAmTG3MzH6FOz5Nnn+TzFnII2wxLP
	 fnNBZAybLRaetqVXuWTB+lSB0DzuODoH4MwdneFyTYUD+dYHJK6Jd7XeufpJP3io+dREA
	 eeRWYspABkF2kBzDKoV7MfTb6jF9zLytq1RxvCSTyBx/Z1UZpt4BsxnU8dCk27QWyPyNm
	 E/CdqkPFDKX1gEd4xcJouGLRV1AGBeJDMzrNYQoVKAQrupxhaWBEIv0saEOIUp9qflv03
	 J2EBdHrknMLGkIGEqQpB/l1scDFQ8FFb5q+QSUmCdJyWf+e4kA/EJXPon6LlAMP6cJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7258606A31B
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Nov 2026 10:02:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7258606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-53644b28706so24647391cf.3
        for <linux-hwmon@vger.kernel.org>; Thu, 05 Nov 2026 02:02:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872928; x=1794477728;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LrgDMUrSYXpYgkAhfsYKg0ebb/uLgOfOMhqzX4yL0j4=;
        b=K6L9r7xQ+rqUQdwWewbn6maKwXE3V8ZB7PT3HC8BROwfwxdsfZJwZf08z2tQa2hSlA
         +MHFN3DS1scVMNXiLZhqvz+hGfqtxunEwrJeT2kXeAnME+FSBvYmHCOhSYlZiqghL6AD
         lHRR1olyPBHBlaGoFgL3VasoxYkD9ZVDvI/lHi404Rcp7BYK/Fau/woUi0MVrsoYTw91
         B2DrNkz6UiMutO2N7Wn2H41vT753h8uxwFuQN/Okquz8lLi+t6jgprUSzuHOmv6RZLVR
         B0xLBE/dilTFRgTEgcN/tM2Z+g8C1q/7TG4TcE4bzbG8N2NUfLf94r+CJBEp3rT5yBS6
         WqQA==
X-Forwarded-Encrypted: i=1; AKwUvBw28ZIcbuesxbD+WWb63XloyupKYAlimbIi/AFOkYXuqRY8HGC2+Ly+9/RhKlsow+USHi9UeESfajA0MA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/K3fQ8GerYDE9oFgWTJLRz+uNBI3UdenP7zxboLzqCrlf0f+on
	ouxJEShKpF41p0BM4SkfXTY/ECKeCE1IgL8k9Cczv/XetXj7WfUajjgxO5+8rva0lLQ=
X-Gm-Gg: AYBFou2Ja6DHIf7qJN6iJw877uD/sd7hbwMCcJydDRw8POuvkgqatxQD+RUYpebtk1M
	BoDwf0vAcymGypXfGq2QFxmKztSzirT175kGu3Re3lCMySjsF4JbnnkDGRwyzrRZ8MHB8RMSQwq
	DAM1QGfCVJTo/4MFP1ugvga0j8hI5xswMH15ZDU/YDByOvAsDiv2QjYWhtiby8W/23VIeHxB7Xl
	U4M3hU3GL5Q+N8lBe53bHiAgwTzTOzsmZQDeENstO6xkn2IHMvHi8tkqz5hGUOnKNyZrs/mAr7D
	0Spcf1GC9LHB2e/BXnzVQjni2iZrlACiDbz6gMRuA9NzSriD6sNePli4rmrlJqsP+SSH3dBZIS+
	v/gTtmwYYm6c1y8DXW2QMKM9nZ4zFrZPMWwP6bAsE+P6MX9HMfnHujBJynoz6ux+kIux6eDgI6u
	jXvfNdDErvBSmE8DLsw+BAUHmOG0864yiSuYw0m9bDYDqTEy7FFo5jzVTHb8v7AlszBBghogg9n
	9eiIMMrprJnjz7aqnEqM2qhsVzMFd9Os9fQYP53FnK4Hk4GvLzp4p7I6a1B8k6Fgu1GFVYsjQKj
	4PkpkShOjmGpY52Kzn4QP5cBbz2HbFLatQyPby9vsILcasw8MeBqpxVhhZSek6kc614/6g==
X-Received: by 2002:a05:622a:3d2:b0:536:747c:3e9e with SMTP id d75a77b69052e-542b7ef856dmr308406781cf.69.1793872928630;
        Thu, 05 Nov 2026 02:02:08 -0800 (PST)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com. [209.85.160.177])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e939fc1d9sm22036496d6.18.2026.11.05.02.02.08
        for <linux-hwmon@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 02:02:08 -0800 (PST)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5365d26ccbdso19505191cf.0
        for <linux-hwmon@vger.kernel.org>; Thu, 05 Nov 2026 02:02:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByGz6ctWmPQuInMty8DuRYhzYJLs9BF0Z5Oh+B/+JXoBnRW2nmbKoFnmesUBCl1tZmGDJ7GHzO7xnSaXQ==@vger.kernel.org
X-Received: by 2002:a05:6102:5108:b0:7cc:56a:58e5 with SMTP id
 ada2fe7eead31-7d072d84a58mr8269567137.37.1793872526219; Thu, 05 Nov 2026
 01:55:26 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-drivers-v2-0-245e54e87116@kernel.org> <20261104-work-procfs-drivers-v2-2-245e54e87116@kernel.org>
In-Reply-To: <20261104-work-procfs-drivers-v2-2-245e54e87116@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:55:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVHxQvKnJyKHrOZhaOg9Rn2hMeRU1JnMFFEEi31FPZaGg@mail.gmail.com>
X-Gm-Features: AclHuK_UsJ1nGicdWEWcMLQAICTi1A7pGF3yhNkxXkXRPqohle17eXAHHNBsR6k
Message-ID: <CAMuHMdVHxQvKnJyKHrOZhaOg9Rn2hMeRU1JnMFFEEi31FPZaGg@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 02/26] zorro: let procfs copy out reads
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Jann Horn <jannh@google.com>, 
	Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, NeilBrown <neil@brown.name>, Eric Dumazet <edumazet@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Jonathan Corbet <corbet@lwn.net>, Christoph Hellwig <hch@lst.de>, Greg Kroah-Hartman <gregkh@suse.de>, 
	Joel Granados <joel.granados@kernel.org>, Kees Cook <kees@kernel.org>, Jan Kara <jack@suse.cz>, 
	Jan Kara <jack@suse.com>, linux-kernel@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org, ntfs3@lists.linux.dev, 
	platform-driver-x86@vger.kernel.org, coreteam@netfilter.org, 
	kexec@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-sound@vger.kernel.org, netfilter-devel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, ibm-acpi-devel@lists.sourceforge.net, 
	jfs-discussion@lists.sourceforge.net, linux-alpha@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-mm@kvack.org, 
	linux-sh@vger.kernel.org, linux-usb@vger.kernel.org, 
	samba-technical@lists.samba.org, sparclinux@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-doc@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-atm-general@lists.sourceforge.net, 
	Takashi Iwai <tiwai@suse.de>, linux-input@vger.kernel.org, linux-raid@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-debuggers@vger.kernel.org, Chuck Lever <cel@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Nov 2026 at 20:43, Christian Brauner <brauner@kernel.org> wrote:
> Implement ->proc_read_buf() so procfs copies what is read from
> /proc/bus/zorro/<slot> to userspace after it unpinned the entry.
>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
