Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793642814;
	b=PD44PEB1TkNLFwnuGrNs2PX6F6PdAiXPvYi5/pZg2NzHtQ76PD+asagkTKwW5CRe1eIJ
	 k/sWV/ZZBrBcAXNksi6ohiy9meg1Qfzc22r2LrkMz4sDUoa0Au3FCaIeQ6LuWBxk55NUb
	 jYrGgfT5I/xRt5u6xmfAj4vCVSZj/hBkg2izBuO16s7Uj/RtF6Ebb2U3qpAmz+GWDU/zm
	 bMaJpVktw4WN7uuw7LfoT80va8gmwHIyT8BhHfs+RrUSt8jU+QDemGAdmUN42wYSvaWrO
	 ZGmFlYBgSSi6mtxumuuHiGG/eGETYqEG5CFMFeCEizbMGPTc0J94fhuQntrlzoaGIxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793642814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=/vXXDZI2TLqXD/tqTZGHj/cF0YcMq0fXP1TpWYkM2ME=;
	b=5YAyjIqq4ARJpOCHg9vJk7YmODzt+rR8XqCKMuHotne3PHFxGU0yl+9C8RbjXJTqc36m
	 eXISsaZi8puVvP9cFu+e+83vF3kml0qjc2+43XjLjHPd5pWkq8jp9eYlpxgzUka2X1zgi
	 0zV2eOHLa8balr8XiQ7NDvDfbqBLPJ9pXyt2fmqibqPB9jLi+gRMb3EJJKQzfPL/7wc1D
	 NBqAd39pchRP+wL7U1arNZrLrWA45q68AkChgN1B08fYhUHme+djWNw2XXl5CbEgOctBZ
	 Ir1K/t2rAMuVmVEOP6kw0cYl2+aftzjmPKGAkDDMnG3H26rM9HJoffgjWcEvCstoTOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=O1qT8yKf;
	arc=none smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10CD606A33A
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 18:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E10CD606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=O1qT8yKf
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ab3b29a210so35857711fa.0
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Nov 2026 10:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793642812; x=1794247612; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/vXXDZI2TLqXD/tqTZGHj/cF0YcMq0fXP1TpWYkM2ME=;
        b=O1qT8yKfRqmaFKSkWZgUywnf1oIKMZNNWK2Jo5Vnh61fpRVagleLOz6KT6viewHVC0
         kLEBj/K6PYfk8YVrAndFcO5Xvb2U/Ya36whQ6vhnuUim8HpwABlRlA/BZg1mO6dxKSlw
         lSRux01pS8z36ffSWkBjV/P/EPrrhoOjdrkGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793642812; x=1794247612;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/vXXDZI2TLqXD/tqTZGHj/cF0YcMq0fXP1TpWYkM2ME=;
        b=YjnB9s9xiCeG7Q7yNxl0GF3lLh9CKL/eYVoszVD1XqVNWkIAb4UJ0R7RwtDyU5EAb1
         Od9wJpqv40FoqXbn78McxqK3Z985CL5lnkuGxSFflZobsP9kHfC+oMdqTDNdabsry+bG
         drWZT1MvbYfAZ7SEI297R/iaeapaEp0ubhumzHRe8UYd7e38D3uDPCeWj1YdF92cJGt3
         fTKfJqLyuxv+fS2DFQTmpb6T8q4OBtvB83QA5O5wP970aDW2BhDdhDPhEd2Oq6ZoqIBZ
         jJu1JTLE6i7Pcx4yqsu+j4bzthtmLSN5veYvR0ic33jm2amP7xd1q0TQ+Zwn8Y1jpF3K
         3lyg==
X-Forwarded-Encrypted: i=1; AKwUvBzvD1iHhGla5jZSq4Dahcmnn4jL3cBIt4vYfDEhOYOa+H3tKrgOAkML8lfSpFBjGm7Gt6xwTG7Tx3Tg+Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Wl57Iq44tjTyjUeZpPL+tL39yJ0xv7XVqTtC6MpN9xFDycHyz
	ELOd+wz6Ir+0jAw5Z1/LFWMHdRMv70Da7DFxiXF9ayVJtWaP/sKG/WzS/3i8ghC+G5XHoYU20XE
	kjVLzAostIg==
X-Gm-Gg: AYBFou0MBlGn42qHOM6RXCQqi1eDNYlomX2GOm71Py+VNszB4U1xOgGnkA/Kme84cAo
	S+PsjLFLnMdi34VgYD1fpUyBTnVDCm8oiE4jZ96NRwh+GWLe+ky8lBF9K7I8+MPg7vnjxVy7i/h
	692U9N754s4T4Ri5p+o5GRdJEgYppD9mXGnyVnxLd9EeVQVD+eEMo9y6eyoVAGaAzfMuvOcUCPR
	IV+0et9tcFGor00pGczXt7bmzy29EdxCvsm1w1XXYGsjrMwC4HwYwCx6bddORNrNIM3JolScBNX
	Ntr4eeRZn0BOHtdTGUenBKERmsa7HbUnIMJePsZPwywpKpKmjf2BnDG2B56Xy4Urmpfw5YznZvz
	Ia9h0IXpVSSzZKILba2M0COvRssiD6vioNEFs3vklIRHsZDu8SjZgsMq4cEzL6iw63fSg6DT2aP
	XR7AbWHF/zDP5VhLg+QEYm2RVEJ9K13JQAlJdx3mqKPjb2lF+x5IX6qbFEfzJg9qZnSppPrrV5B
	QHRFB/pBxItLH+nKxEfwBUGRoC6fAeqmWih+2GCdmu7kNH1LZGOyZPM4rJ/ZksHHtuFaBU716D8
	jU9P5avKpf415y+siZ+JWxurEVGxQ7wK/B3VCt1VEC1OdUwFbjPyTeKfOO/uMbUUX9eQfzGPI6y
	5iJ+xGA==
X-Received: by 2002:a05:651c:1b8c:b0:3a9:d111:6520 with SMTP id 38308e7fff4ca-3aca55f2846mr31134861fa.0.1793642812124;
        Mon, 02 Nov 2026 10:06:52 -0800 (PST)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acd5c33492sm897341fa.18.2026.11.02.10.06.51
        for <linux-hwmon@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 10:06:51 -0800 (PST)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ac65e845a8so38033991fa.1
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Nov 2026 10:06:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzOzDE7UQvZCneoDCvdrP6Go0t5Frbsi8mQSzPK0xygVN8Fz9BP3zuPUX3vKpIzE4OYCy3uh3/KdorMVw==@vger.kernel.org
X-Received: by 2002:a17:907:d94:b0:c2d:c80e:8366 with SMTP id
 a640c23a62f3a-c4ca7426f6emr874452266b.0.1793642348398; Mon, 02 Nov 2026
 09:59:08 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-work-procfs-bugfixes-v1-0-59422ed3e465@kernel.org> <20261102-work-procfs-bugfixes-v1-1-59422ed3e465@kernel.org>
In-Reply-To: <20261102-work-procfs-bugfixes-v1-1-59422ed3e465@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 2 Nov 2026 09:58:51 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiSA7-mqmAjTQDaU7UjUyWt0TxYwXHafL8ZAPudy+B_uQ@mail.gmail.com>
X-Gm-Features: AclHuK_qZTBVsLQIdymgRHScSFenC6XsGggUDmcuOugjrSTbuVkeASUmC_hYPZo
Message-ID: <CAHk-=wiSA7-mqmAjTQDaU7UjUyWt0TxYwXHafL8ZAPudy+B_uQ@mail.gmail.com>
Subject: Re: [PATCH RFC 01/38] PCI/proc: don't truncate the position of config
 space accesses
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>, 
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
	linux-debuggers@vger.kernel.org, Chuck Lever <cel@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Nov 2026 at 06:22, Christian Brauner <brauner@kernel.org> wrote:
>
> proc_bus_pci_write() truncates the file position to an int. A pwrite()
> at an offset like 0xfffff000 turns it negative [..]

I think this would actually be better with rw_verify_area() just
checking a per-file maxbytes.

We already have that logic for lseek and friends - using that fairly
hacky combination of s_maxbytes and !unsigned_offsets().

We should combine s_maxbytes and unsigned_offsets() at file open time
into f_maxbytes and check that not just at lseek but in
rw_verify_area.

And then things like proc_bus_pci could set it's size limit in one single place.

Hmm?

                   Linus
