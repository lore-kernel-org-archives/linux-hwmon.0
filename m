Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793822729;
	b=vE5qBmhX74C/tilv3qvLOC70migR+Q9VA/dvh26uoNL9v/yj/sJ9TXCJXYLGum8GVW6N
	 MMLowSI8Ac/vuiWykygjDKV92zLoBoKCXzOwK5MX15cQBRZJwIslhwViLCLOOs21GqA7z
	 PNFVCET4UWZRHX+VhrKn/QvnbOPuaip2swCYSXwoBIrD3jchf4g62ISKeP5lmUt6XKVXG
	 UuJZqeJ0ljrNIh5lBZvQkrOUdlYhNbOPqkZsUbMqtxgSlklPUhEQZg37n27Xv2aLwkYkD
	 p5JBCPVsXTjG5Hi0BnJdkZr7q1vlfOOQOV0hpIckqajCmgv6WcudGGFrab+bmlJ40+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822729;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=LCqiLHf1DIbfKNXx3ccWkvqxBhOdwo3yYkazQxIGarg=;
	b=1Zd5qpL11gIAm6b3h2bx/PbUcOE2yj54kBazPyiJm/VaPMTVFlEP/CVx2IroaY7GdLa8
	 xK8p6LI5wNwAKWPd+Lpj0cSXIQ/qq2AYv2PS1TBjRWGncPod3xUsN29Y8xflT/618ILNc
	 Q4hmCThIdNXQBWFvrXNrqhSz2tco2k3F1Vh59oqWTAuzGqUDzZ/wFVIILh+3QZbgqtSP6
	 NLYe2+f4YN6U9Vx+PugZFcm/Sf7kPphg44c5KEWDYhMhykMoDlzwMllIKmzi3hC6nNbVE
	 W1O4smsQomPAPZMgLYaJ6Q3grnzM+pCC9ZCe9IzXmKT/ttFYKnifKXvzLIDYsPKSHkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=fI2nmlcI;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65C1606EEAA
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Nov 2026 20:05:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B65C1606EEAA
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=fI2nmlcI
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4550d8ab15so175926766b.2
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Nov 2026 12:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793822727; x=1794427527; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LCqiLHf1DIbfKNXx3ccWkvqxBhOdwo3yYkazQxIGarg=;
        b=fI2nmlcItpwZxqRsmDWssHJaMT2IN8dLg7E1xDQbx0Et/5dAwJ3lC+28bQvSn3TcBy
         jCCz6aP+hY985kmEWKQ8J3n3DZJgb7Mf7tqsXWxEtttRySDwTo9j3SEkofmGPUukuzUB
         aTxGLiQfrDGmJiexVo8c15QHheFgr9P51oFII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793822727; x=1794427527;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LCqiLHf1DIbfKNXx3ccWkvqxBhOdwo3yYkazQxIGarg=;
        b=y/FzufaeJcJJjQfBOozwkOLJImI5Tr2qAeerGzRlGI0/tZcGzAryqdvCfAvtuoQNVt
         3dgQI/LUWLb9/LUQPScaCqUY/DxnzUDHLOyYCnhvo0vX7OZ+bBBcFenAg/TwH66QiQr/
         1fgkHP3pmIm18rC2LpaBXmsoXmXu/y5/g759Dr3qt3OxjSmSKbED+WJLrqu/mChHcpRz
         KkhJqp8Hw+vJyIXnrNkei0U2uSA9GXGfif9ihrDrhAzjZRC5dIYOwcj6AyDkfmj+4tXb
         CgNt2gFlWNE4tb0slmnPLcX0GTJ/ngdDs+jXl0trE7wMlI93/QvwwgLDe66qcW6ycNCc
         SEQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzm3XQoJU2WAA6cZgQoDAaYYOJ+WPEnWyBNzFBbr5oRiGzNwTuyneckmv1kMd6S1wG+0f5T9FT6bSWQfA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/LpP3T4iDLaEpuTvmYmFI9OAUVnyTSSJ5FTYYOnu5TmwYjh8hF
	x5wWdLLLLDxgp22hjNHr5QzEoqPT4GYDmY1gUkgsPXZ5t2TQw+BdZPEmPoY1M4O05/lv8vH6ZTE
	Mym/ay6KEcg==
X-Gm-Gg: AYBFou2fdmtIJgY0KreEtLKV1RsKxc6DBnPuC+mfW47ORogU+kcnn5BeMAbc4f0Z+2w
	IpTr8RtJm1+6Tl++Y8xpuHnIUiRBZ6C99kRbKEY29hPsnIHm157sAfuSHUrDxUd3OtUx1BSxIXh
	MZE4sHszvXOms9vtY5TPzEW+1sX2il+7K9ewhxq1WVKSwFih9PTjDqb7pg+2xAGGiM+TP3R5Qeo
	e62eIPUyZFJGZ1NpgGRWDx5EQNmyTpos59ISityhQbB33YP2YPHKI9Aa/M2HqiDP3CTUk8TohLO
	m2DRE5fikt05dmX3BZedaI1YyyV4mZLC9XvLFDUFKhM0p04a5AwSnj26+boRXC9qjbftBPJZEo3
	4RmAYkxiEyraRsJQc+bQTm37uDe+m9nBGsML3gt2iKExlrIMetXVZcKfNueK5aC2vRZnnecwI9p
	51Uolv3Y3N59hCma67TtZbCJhS/1cfgoEfPyPzX8asQ/pVdvQHd0y2cDade3QaBnDo9RtQ8fIFP
	UWrauoccueswMZee+iMgzdNeHOOCHg2RLE/gbpO6Zcy1UJyrQcoChnnCCH9k0+6+27HyuvyzhZC
	E8IRj/m/2jHjyXkJoywvXek+WKO09Z6/O5UL/x58IWRfCkHc0eXpG9GOPUlCu/9btRfrFwcY58/
	YNvE=
X-Received: by 2002:a17:907:fdcb:b0:c27:420b:7c79 with SMTP id a640c23a62f3a-c4ca7af1d9emr1505836666b.48.1793822727060;
        Wed, 04 Nov 2026 12:05:27 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e468326sm101335066b.55.2026.11.04.12.05.25
        for <linux-hwmon@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 12:05:26 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c423b145922so162302166b.3
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Nov 2026 12:05:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxbMHjLo2RnzGKADivd8gY67yZi9jVqMRRW6Jw+6Bl6hVQaORSUTFnWromL+noZM57I6IX4kS5E2pf6MQ==@vger.kernel.org
X-Received: by 2002:a17:907:60c8:b0:c49:a4b1:9cb1 with SMTP id
 a640c23a62f3a-c4ca795fa50mr1973235866b.3.1793822725121; Wed, 04 Nov 2026
 12:05:25 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-v2-0-b45cd5789ac5@brauner> <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
In-Reply-To: <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 4 Nov 2026 12:05:08 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj9Y9NcOesBBm+jhPjYa7qO00fD7g7uwX+H-k0-R2difA@mail.gmail.com>
X-Gm-Features: AclHuK9j_YIgrwhhpWOlnull6heAULBd4dgTqoOhUQQjFm_MgoIgrL1vgPfefvI
Message-ID: <CAHk-=wj9Y9NcOesBBm+jhPjYa7qO00fD7g7uwX+H-k0-R2difA@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 00/30] proc: convert the fs, kernel and mm
 entries (Part 5/7)
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
	linux-debuggers@vger.kernel.org, Chuck Lever <cel@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Nov 2026 at 11:49, Christian Brauner <brauner@kernel.org> wrote:
>
> Part 5/7 of "proc: move procfs to what kernfs does", on top of part 2

Christian - way too many patches, re-sent much too often, cc'd to way
too many people.

Nobody is going to read these repeated resends, and all you are doing
is clogging up peoples mailboxes.

             Linus
