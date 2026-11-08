Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794164398;
	b=zXxFRg0QcP+ygvCTx+udrPCKOj+1A5fYBbivBMMGWSx5e9w5Kd6kQMNa2cwlnn60N9vY
	 G05/dWAVmNaqtnq/j+iRK08T1xs/chFyipz3B5eQniJZXMCQdE4XqJvDN9cByC1i8KZep
	 nUNluBQkhcq6853/X/EzOJbzNg8W0K9ISYAQ1pJt0ZJEguDxM/oHybZ7Cm3rHMdnzqdtZ
	 cTdG27bgwSLceE8YG66CxdlL/2bkqskOzK45ZK6vpJkc7ACGK9NnnSEZXqlJ6bShcj/np
	 /jZkkuXMsjYSzJnDA81wPapV1K5Ksrcf66cveIwULhFmyy+JkcKLzXC3uNp2hrEh1pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794164398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=JLhUwzup1lwefYy8NOOFjthYnrByVfTsqIe79kkV+Lk=;
	b=ImyckCpUUaDgGxA/zH6GbvOSQZ9XpFr1t4Qkt30c5CxnHtq0+qZrFzpwg+30kRnnFvBu
	 lxV2AOtTTmwPVfikTflOhU0ADiPQateUGLjh6nn7J2jqY7ZwisaHxezUWGJl+EIJxEMkf
	 CekU8ccx30I6FaJpHh9I8HRojQtKGpGlQpamdxws7SM8F4ORKzsrqhx3z4iyYtVoXZIK7
	 eH847UF37LEyPTBYEklJdu4HrIhgGURJJMbcDf6vFMLsyd9wFfBUFAE2TPDUgCDOdsE24
	 RU5rxF/voeaPNh6z4LYzgFQ0p/ykDC6DFKeeAjHgYODb65LTFMF9oFdoIHP0VJcnvSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XrEUEgHU;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3476D606A331
	for <linux-hwmon@vger.kernel.org>; Sun,  8 Nov 2026 18:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3476D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XrEUEgHU
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso1791555e9.1
        for <linux-hwmon@vger.kernel.org>; Sun, 08 Nov 2026 10:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794164397; x=1794769197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JLhUwzup1lwefYy8NOOFjthYnrByVfTsqIe79kkV+Lk=;
        b=XrEUEgHUwv+lt2Z0T4RzlOQuYT1yMbnY/MJrtF5HY2pc8m0ujKE+1IGJbqc3A1SsPJ
         Pz+po0Wh7ECcrOl1hyNdZBme+OsO/r11IeCA1lW9KMbstFhlOkC0Hm7Ef+TTavGsfrDk
         7T2AE8nlcorDhYFpLo0KTCt4xOv09AacMRilfH2h4PS2mZ0iBReAF8XAcgtI3iT+qlRY
         EJQPYUIUlDRCCjadf1+24R8V0flZyhCZpLCroCVsidoQ510350k4POOaAcSXgGRrBTWF
         rbpUnz5O6K0TOR8uz/zwLHiObwDAqnCJFWP0+ssCNYCBYnXJwQ2yMfUqdKkv6ro/lp/q
         XMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794164397; x=1794769197;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JLhUwzup1lwefYy8NOOFjthYnrByVfTsqIe79kkV+Lk=;
        b=JDYhpRND1oruMCdC6lITQs039+09b1T5R1GZlIfpF47O6Wfgz1lQ60rre2ZCXanHBv
         84RJgc9UplRNNn1eFUHNVexp9w9/M6oRfUg8FYARx8PKx+lE3HpuYytZ+uVh4x2bWh7/
         bwYp8AtQ9de3MfqRTwaAnggQzpWM0u+J5Ddg3t1pU4JYIUWV4GluI4Ggvwc+BvOUOFzp
         A2vOn6uqfhM/LSnXkiTDzD8hO9MHPNr4OoL0TeBx4ENGyMEsM2SP6u5/DZFM38r/fgT8
         EROL7aFmwKHLZ3YQdXE+MBYnBIrNBUjgjIUqNHeUhepU7Rzbka9j4JNx8Di6qd0ANsA8
         hakg==
X-Forwarded-Encrypted: i=1; AL+hErGQUPCAxQQZtsfyMAfmFf9YFUx0G//kXbsTpIuymH7VE9sIBF+XrE9HWukkAI0qYUZwZmIQTM6zJTjW3Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z/zKA+W9A+fJ28oSIFIRM/ybN8PZppdoXT1QiYOM0VTVdl55KjW
	7EcxoGld9l8ZG/5vULYq1yz7w/pWFh9QpxRpoUIkT1AwzU6rU+Sf1NTN
X-Gm-Gg: AYBFou1bUxFWLBRkugSDRo1y2FoAveCH5BJxUrJCNehXUcF2x1q6taas0PqmZSIXafK
	4iOFRmUpQxo4XJzcNdwr4hqXjbTNfhytFeGb4VqNjovB9MLXKSkvKgIsFrJjn8bjvX6r+MPawso
	Y85CkhD3WSS0zB6ArdE8ZNWxqQ2NtSVY9Thqkls+UKjfQYwuC1bnTByXxi2KJ/X4phwzszzbQZA
	uAP1DxuHWuWWXWOAmuXWw8tJZC4AA2JXJ4m1yW3kSljXXss82vnB+EDm3Yt+he7ky9OHv6D7i6h
	BFsM8SWzpzMHme0s4dEQHIL+X5jthPijFxt3wgMMUC8u7wOlj1tzSaP+B9j6cwRDJ+xaQ47qy3T
	GFxV/Iic5ZlOHQcCBM2Ngls2bo3KLtUVUqVlM5fVKhpuUcYLQ9ZChXZ0g737MRCqx4YAv2OTTY/
	LtRLdeMR7tROU8LaQFuBof/vliJUulS6a3eFo3ve+Q1PJf/2ciSu9sfcrI9ac2MClumwsbcm5FM
	bnADkiqXwsR+jBa4lhPZR5dyQn405mYK79tD4dIbj9NkTHq21ra6uV1c1R1k4rLEbIkCXDSH83x
	LLp3NFQfO9y4beiTizXb2w/1/zBMiPGryHlMPjME2abVJuh7tjFBnPxOnBG+qzFa
X-Received: by 2002:a05:600c:468f:b0:4a1:7e77:c382 with SMTP id 5b1f17b1804b1-4b960d9b170mr35982125e9.5.1794164396406;
        Sun, 08 Nov 2026 10:59:56 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1f3acsm185228445e9.14.2026.11.08.10.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 10:59:56 -0800 (PST)
Date: Sun, 8 Nov 2026 18:59:53 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-fsdevel@vger.kernel.org, Linus Torvalds
 <torvalds@linux-foundation.org>, Jann Horn <jannh@google.com>, Josef Bacik
 <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, Jeff Layton
 <jlayton@kernel.org>, NeilBrown <neil@brown.name>, Eric Dumazet
 <edumazet@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Al Viro
 <viro@zeniv.linux.org.uk>, Jonathan Corbet <corbet@lwn.net>, Christoph
 Hellwig <hch@lst.de>, Greg Kroah-Hartman <gregkh@suse.de>, Joel Granados
 <joel.granados@kernel.org>, Kees Cook <kees@kernel.org>, Jan Kara
 <jack@suse.cz>, Jan Kara <jack@suse.com>, linux-kernel@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-um@lists.infradead.org,
 linux-wireless@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 netdev@vger.kernel.org, ntfs3@lists.linux.dev,
 platform-driver-x86@vger.kernel.org, coreteam@netfilter.org,
 kexec@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-sound@vger.kernel.org, netfilter-devel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ibm-acpi-devel@lists.sourceforge.net,
 jfs-discussion@lists.sourceforge.net, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-mm@kvack.org, linux-sh@vger.kernel.org, linux-usb@vger.kernel.org,
 samba-technical@lists.samba.org, sparclinux@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-doc@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-atm-general@lists.sourceforge.net,
 Takashi Iwai <tiwai@suse.de>, linux-input@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-debuggers@vger.kernel.org, Chuck Lever
 <cel@kernel.org>
Subject: Re: [PATCH RESEND v2 14/23] proc: let procfs copy in writes before
 pinning the entry
Message-ID: <20261108185953.28054fb3@pumpkin>
In-Reply-To: <20261107-akteur-gemieden-eckdaten-21304d085e35@brauner>
References: <20261104-work-procfs-core-v2-14-76ace653a773@kernel.org>
	<CAMuHMdVfakapgBK6TBhO1iWX8qzvLDk8jzRS=t2MVa5G=MCUeg@mail.gmail.com>
	<20261107-akteur-gemieden-eckdaten-21304d085e35@brauner>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 7 Nov 2026 10:48:35 +0100
Christian Brauner <brauner@kernel.org> wrote:

> > While at it, I think it would be good to use this conversion as an
> > opportunity to replace "char *" by "void *", which will probably let
> > you drop several casts from users.  
> 
> So I tried that too. The thing is it drops exactly one u8 * cast in
> ntfs3's label write. 

Since char is now unsigned that one isn't even needed...

David
