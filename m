Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794273719;
	b=hYeaBeSrkSQZD5MrmElbMVETMRPtfmE7pnHHCxL1iWtxFFTiKypfYrZmSsZ3lIrZI/fW
	 hQAt1WTrogaDOE9UAoKIZ2lvw78yR1mff77sFtwpHF0K9D69KJX9ZExkUYT8PqNCilHxX
	 qa7tNkRACu2Ijzpft2b3/fwj5oXihJBCQs29Efx9Uuz6p4dpVdaIN1pgOBdnDAd6DeNCf
	 eKGTzQI4S4XtHlDsmuShnxZSEFH3MEYxda8AYq6Up3qBfh/UCNMKNuXW3AnhJNPJRdOg6
	 OIcVotC2iGIR4h6t0L34cvTrgm72RVdsIYih1/Y+UhVsTZvQF1Vx8rtJQGOjBysWzOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794273719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=m2qXctBTC0OPADf0V2KkMb6r2GA0JgabIuFAMe6ERzQ=;
	b=4l0xPIbBnLVGorX6jthw0j6yLE59fxVLbIleD6Xy1i8aCU0JOyFUtn2c3ANjc8EZrZQb
	 6rVqMkVeAsqewQ+1rbOO10A5DuSQ1w1WUbu6qyo3S999W9cIy078qExumqfgHa7g4fV35
	 Gg5/kuo4YKdqfc+DIcOkCAAs++0Z0ynKiTB6LKW7SKNg0iHu4el/V2WtaOHTHfl365cvS
	 W31NXWONRqs4f9ao79gKFSzyA3db00Ta59ucaq77jswt3FIIewycGEBmWcbIzNS3gdJkY
	 pRxWicVyzxY2eluB6EqrXxttrBEXvLTDAsiV5vcs2rvzMvn4wNc9sVAXB7fXZKmegzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=DDUJhJEW;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FEB60A3801
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 01:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5FEB60A3801
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=DDUJhJEW
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b6e7a05225so2032545a12.0
        for <linux-hwmon@vger.kernel.org>; Mon, 09 Nov 2026 17:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794273717; x=1794878517; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m2qXctBTC0OPADf0V2KkMb6r2GA0JgabIuFAMe6ERzQ=;
        b=DDUJhJEW7i4cEtDM6nyNGyI37qCQYSp4H3l6T0y+XW0sF9J1lD8pQ62CsB5XVZPnH5
         RGaFKzaqy8GPvgOEww3Sq309koaVTi/dKVgoibgSnev5S+KngKIRASynmdd9wIlZtjtM
         r/7sU0I8af43s2y0vP+IQvJxZifZKgrFnNWu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794273717; x=1794878517;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m2qXctBTC0OPADf0V2KkMb6r2GA0JgabIuFAMe6ERzQ=;
        b=QjqbHX/ICfYn5J2sx7V7wcMhQzzwTxTaU/L6ANqsVGB87GvCmV3dyDM51/MfLT47hZ
         vS/SIewlPZN4Uha6B8MQnG5wQoEy7g/C63OAjS4JC2BvWJgRyB0+Suk8mWLA8LpDwCmo
         fytTQS0QZrNEqbiUfq0iHw88MogeyjIHq9w5n69pISN8TFps3LDDXqnC27pqKZU+uO5B
         TD389LiUrQ9fEfvIJUGqKbiOd6M2Dhz17aqUPzQtG3ivpLOTv1hkLjXxMHDqDiKuoHb3
         JQ0H+UW4CQmyn7u08S2lxBCpYenn9iQIscilnne9x9eCrJ8lK+0QDVQm9JdL5yMzSwKY
         bvVA==
X-Forwarded-Encrypted: i=1; AL+hErEuekFx5QiRD2XqPQ3J/bFFI6Xw0f1l8C+qN4YBU/TrbM1EmZ1o4xSw5C+feUaiVB1/Xe5VQQ0K0HWuQA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+exm9FG+zm7jomtsQ55i5NlI1S933FGPXWvA82UYR6Hsz2vwzj
	S6nS7SvC5yItUtO2zYZ1QMe7SeA8xcFMY+xc85FfHHn+ToERc6Lp65DIOOQgk2pKC4X/BlWgid1
	fEcmG2LMBew==
X-Gm-Gg: AYBFou0GM2zlvD+JBpMopZSTyxKwElmp18h49sh9AdEWWPvvrt4ffPWMlA4dm5In8EK
	B4Q/aYLzxOhWx2VwT1nlyS4VtMYSKG1Fb1M0gm7bt6YVATFfUD2MgzBnwmUWb83S8Gekq/T4mhT
	YT54ogSUU9wnHRG+cfCMjeiN4+ksdUxZcnoBcqwjMLKT+wWEGn1OG3sSSM9LjIJ6Xpapg0/JKRo
	4Pf5aGX2ojEbv3WKw7uu+QDzxzqF5Tlr+PxFcYP4xSoHJRtsai224sXTlNX1vIxUENxah5VN6vP
	hmLhXMAlD2oisrloIK06sK4mLyBgPHaD7+d67gJnJ5Z/8OuyqFyqxAdGAcDuQOcS2eqRNU7yb8y
	jZi9M7IOklbq3ylDiL3QyHZopZhEwam6WwlX2sJhSTYnlNw6/wUqAUfn5zXwGTgI1RDHoHU6rFT
	lL1Zn0l+aVvkiDtZ9QiXZTQHc0PKuyqLf91EJ1e2NjGCfTWiFlTA/zbHoNZQSp7NDx+dgGcn73J
	NIo2nJw60q4JfcZieQyPN+iUTx3SJSzNzkpse2YrXHgjMhA04gDUSK6uPEAV3rs8bhvGXbzK/pv
	3eiJyrQHdvtoF3zpq9oNuWWzgw4yzGIbCN/CGMsgYm1SizV3g0na4RCaxXIZRIPnjoO6XNHTGVC
	5qQ==
X-Received: by 2002:a05:6402:4501:b0:6b4:9919:b54 with SMTP id 4fb4d7f45d1cf-6b756afb94cmr1062718a12.42.1794273717276;
        Mon, 09 Nov 2026 17:21:57 -0800 (PST)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7578be3e5sm425788a12.8.2026.11.09.17.21.57
        for <linux-hwmon@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 17:21:57 -0800 (PST)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4c9abc1824so221743666b.1
        for <linux-hwmon@vger.kernel.org>; Mon, 09 Nov 2026 17:21:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH/nh5gChR73SG2UqCGWkJ5sVX2I8a9r6F0rk1E04RvNWfc0jZ/XDacaSvz2sIxlZz2RPvpSNxqyglyZQ==@vger.kernel.org
X-Received: by 2002:a17:907:9451:b0:c41:1750:59a2 with SMTP id
 a640c23a62f3a-c50495dfbd5mr87253466b.12.1794273275844; Mon, 09 Nov 2026
 17:14:35 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-core-v2-14-76ace653a773@kernel.org>
 <CAMuHMdVfakapgBK6TBhO1iWX8qzvLDk8jzRS=t2MVa5G=MCUeg@mail.gmail.com>
 <20261107-akteur-gemieden-eckdaten-21304d085e35@brauner> <20261108185953.28054fb3@pumpkin>
 <alpine.DEB.2.21.2611090504170.17804@angie.orcam.me.uk> <20261109214558.0d9d5228@pumpkin>
In-Reply-To: <20261109214558.0d9d5228@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 9 Nov 2026 17:14:19 -0800
X-Gmail-Original-Message-ID: <CAHk-=whsA3tKcUCBJDj_vmJ11rVGT9rivgnKjGRgMO21CPmCxg@mail.gmail.com>
X-Gm-Features: AclHuK-x8jcOOQUqd2amGoGEAKER9jIFGaeL4LxxWAd0cGV7dz_RR64PtDogpPU
Message-ID: <CAHk-=whsA3tKcUCBJDj_vmJ11rVGT9rivgnKjGRgMO21CPmCxg@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 14/23] proc: let procfs copy in writes before
 pinning the entry
To: David Laight <david.laight.linux@gmail.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, Christian Brauner <brauner@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-fsdevel@vger.kernel.org, 
	Jann Horn <jannh@google.com>, Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, 
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

On Mon, 9 Nov 2026 at 13:46, David Laight <david.laight.linux@gmail.com> wrote:
>
> Just that the cast would have to be:
>         u8 *foo = (u8 *)bar;
> where 'bar' is 'char *', and I don't think you need a cast there when
> char is unsigned.

.. and just to clarify: 'char' is always unsigned in the kernel on all
architectures since commit 3bc753c06dd0 ("kbuild: treat char as always
unsigned") back four years ago...

            Linus
