Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872223;
	b=QmuMALYbVYFSfXFQ+exClF1+lBqt1MMVaiSzb7Ywt30Bl2dkYTfTPg7tiwhtSOC+gvcO
	 iVwH3oSa6MgU/LT+T9ljgTGC4BXF34Zgna6tIXOLjDKUtPN7YoZ/e7w0pF5qUreST2/u/
	 q/CHxqeUPPmRzWVE7PUJLDbxakgCnO8YMDwm4b5gPzvP7pR5htXVecxeT7lEAemRSqxx6
	 pP3qwn5kLhzUcfFJ5hECyhRCupQRUvcylmks3QFxyk01IveXX78gtZsesUbCccvBptK62
	 GjkYcrGiDvLCq+4vhN3eybUnAES7lnYTYKwT3zQbO/BtoiJMryHiYav+eeKcWnXXelQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872223;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=SqrTjgENN7Dfs+HehxbKPgACeb32UvvfMAFijNHd6N4=;
	b=a01R/aYa3UwttlJt93bK3fLS3r//uqzobnk0XXFnKUpKkFA5yTw5j/4k/bKTIvR8q3s1
	 LGYwlViMQWT7EnQLUslSBdptTzDlxo3H6T9ShHhdTAIlzl9zU6V4v9U7PiE0W574Ds/xO
	 bM1X7BY0RV6z01crYarD176n3dINvQoPWF8GNC2BeoWJ8kJJz2U3NPFhvvyeEgg+YiHar
	 q50YtzKk/hwryJoIKkbjROnCxo74vB1mNORan6T0wtqiAmO+Lr2TS5Mt68cmsl/8Ov53e
	 wgl/CiczxAowGGgMjVPNUWObVFNq669VjN4xurxZ0vvQVNo4anudqBmyntRR6BLzt0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8D5606A32F
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Nov 2026 09:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB8D5606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91c79a9a739so23571146d6.1
        for <linux-hwmon@vger.kernel.org>; Thu, 05 Nov 2026 01:50:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872222; x=1794477022;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SqrTjgENN7Dfs+HehxbKPgACeb32UvvfMAFijNHd6N4=;
        b=v6RqhB999H4uJuGWAZZ4a8e25tGpwqulSBWUGClQHatS1Ljm4818zy8sEYicpk4M0Q
         IRS0r3tzqnaW5o00W1HI/pYWitgHg181QOb6pm/fPZgl5aidQxnVqzHvOE/G8WG+u9Ux
         ghdueAdK+xlZz3PpjuCnpmmsUHuKHcwDCPgZbcuZ8D0I5v5P32ycByllSsHRQbxYZmJ0
         72i9QEJJQibHusM/dLpqJAkswhGeTfrSjBSRLSswegipqbMgznSs6bElS/Lo0+3YXrrY
         dLCsaf952NwXpbu6aEMyGkYk8dDZnZ/yZz2kUXAiKqGomxC5tbbFYSrgiwQfBl+mF/aP
         oqMw==
X-Forwarded-Encrypted: i=1; AKwUvBwv+51vzlQ6LMZ8QI8of6Z4THzsbga06Sxjops0b595Q6C8Txewd3xd4RQWYp1zbVrkhiSuf18KhhopfQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+SkIUxGU4aQkOIDWj2J+3Yl8qEPreaHYbfMrbT8cS0KMKg8ts6
	/WUmn8/n1jGvSNbdHYF+ww5SfF1/cSebE7kCk0/eDLgujKZxMYkXilY3yvy0/blMlI4=
X-Gm-Gg: AYBFou3AJnPhnM/idQwMiTLw8bWJ+inmtFXRv05hrAVdm+VVVthlZY80omkincHcmcd
	uLIupmwfEEft2M7JITi5uPWRoxtOR2/l6UC6eQq4S0ua0/BFC2Zxm2iH7Ym4+EszkPgh+njWl8B
	BaV/pTAmdxDUmHH+mBQ0KEiEUfbNRgZr7KLaGBaNACQGkjSlDFhFpA81K3l6/ML+jTEITEbdzTo
	r+uIwptU1l/c5q3s/yHAYvnVlGYypPW/w23VPQrR5wiFlEQkvEr6oZgypeMMs9RRpmZwbfYBKFT
	XqjqElfEwYjybyy8YJMyXM3G65KlVl2jFQ39aUe128pzpbGKqUZdrOfuiXAEKNi7taj4ac413vJ
	wrY53Ds4s5YiKT/Yid1xEKoDkWutCfT5UXKG9iRqzoHDLFY5xJ5qJPnoAFG4jbJ5f+nkrKOPCeo
	gFm4Z5wKB5s4Ssu4TRnqdmYd+ZGCjkNP1bydRrm6jSlYQ/ySSaEvLGWqCj24TK7RnJ0cmsav18h
	arR2tuEdRYtBvhRE+JOrPW71/01JE5oomXMWI7K84SvS9J42/atLlbcul47veMSJr6/ia0srPOM
	eVfz0HEiO6n7nS9zjo/uKQAWx6OswwPYVwFoiRh/cpaaRcXGKOTnIvj37DuNDbar9yz0v35sLFl
	QSS6M5k92rM0UDVg=
X-Received: by 2002:a05:6214:5781:b0:91e:8baa:f132 with SMTP id 6a1803df08f44-91e8bab0503mr55686476d6.14.1793872221852;
        Thu, 05 Nov 2026 01:50:21 -0800 (PST)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com. [209.85.160.182])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e9f2a9bedsm3432826d6.35.2026.11.05.01.50.21
        for <linux-hwmon@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:50:21 -0800 (PST)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-53c4b82919fso20991771cf.0
        for <linux-hwmon@vger.kernel.org>; Thu, 05 Nov 2026 01:50:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxI5QtWRtSQOidmcJ8EtrRZEYPxogXTkb/7Kfddr8cR0yOEuuaSKIUtJe1DYleyHljZ+wsKXmSdqMXW4A==@vger.kernel.org
X-Received: by 2002:a05:6102:3ec5:b0:7cc:2bb7:131d with SMTP id
 ada2fe7eead31-7d072baa484mr7324212137.9.1793871885062; Thu, 05 Nov 2026
 01:44:45 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org> <20261104-work-procfs-bugfixes-v2-10-021c84d852e0@kernel.org>
In-Reply-To: <20261104-work-procfs-bugfixes-v2-10-021c84d852e0@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:44:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUy1RYKG0g8OWss3AD-jyYx3DXL0K7ABYkFUdxTxZ9VdQ@mail.gmail.com>
X-Gm-Features: AclHuK9D-nB8icBns0zdoQH8fV1cfUPJ6LOey8o_VlUZpDIGqKC4cFf8-j5-HdE
Message-ID: <CAMuHMdUy1RYKG0g8OWss3AD-jyYx3DXL0K7ABYkFUdxTxZ9VdQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 10/51] zorro: size the proc files like what they serve
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

On Wed, 4 Nov 2026 at 20:18, Christian Brauner <brauner@kernel.org> wrote:
> The files under /proc/bus/zorro hand out a struct ConfigDev and seek
> within that, but their size says sizeof(struct zorro_dev). Say
> sizeof(struct ConfigDev).
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
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
