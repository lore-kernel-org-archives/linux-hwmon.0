Received: from out203-205-221-155.mail.qq.com (out203-205-221-155.mail.qq.com [203.205.221.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A86C3469F6;
	Sat, 22 Aug 2026 13:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787403843; cv=none; b=P/N5csO9NOlPXhB4g6QaL5tFOcjyeYtFhEb1H6A+zCI6JVRhH00ydhbRrjJ4CNks0Jml3IEvNx57Pz5BYydsQas4zHdI1lYDX7JfEaQghB/VX181EZB7MmeLvx6ntHzW3p5D1jFpUOJLfttjFWygPIYswqkIKmKo6RYkfGWpCp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787403843; c=relaxed/simple;
	bh=S6iJKuVEDaQSOQDMWol/i+vYyOP+2xbisR76hcg+HeY=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=LKjvdbwNq/WxjWCOtjuw1k+hPVK2/tss7Nw0G2nSh71g+VcTskIFcShfet+RQLXrZ74d0iQKhdyYUcOiQkjLiMpLtn3Rlpr/GrC//NUL/uKQ3m2ryZT8sWhdRWBd4VSsTxwhMJw79G6Nk9DGH/AOA4nz6Ard/mmq6OMvU7HgeAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=T7ev5gRs; arc=none smtp.client-ip=203.205.221.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="T7ev5gRs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1787403835; bh=IQYWtUF3R1YQ57bkADJ5nZ+RDHuUHs0FMc84zv2/Iug=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=T7ev5gRsepCQF7/jbrWW6MU3p4RbEAbq6nB4KozWgmNDPP8+kJrYFzzWyJuxsTeGz
	 1yOmkd4baWSL2wNIm4Q5uXZjaoSx49jhBlWqYuiZXnbmY/qV9AN49GjQwIZ9zCYPcB
	 6TDN//JgDUa9/02Gc4I6GyVeNobq54ByrS6+zZ1M=
Received: from lxu-ped-host.. ([111.198.231.89])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id F41B275; Sat, 22 Aug 2026 21:03:52 +0800
X-QQ-mid: xmsmtpt1787403832tru78cjkm
Message-ID: <tencent_6A66F77626CA5371C36D2968E3AEC4409705@qq.com>
X-QQ-XMAILINFO: NbgegmlEc3JuR5LY4cQlTQ1gvkXjbL4F+s3upmpEH+0VtoxbB87JOaEJMAwCLl
	 g+MTvYvAkJp3OCglm0ohvUGRAWgp0HJaTMdA6KGkGm3PpUzVSEXbsHX89ei6Mum0wpn0+fLT0vql
	 ZmaCUip2mo2/fylBbP3iBN2JKWjRBF2uDxoFbTcfzYnyGfF68FpVLthtdhyyNgf0b7NIRDJRwr3j
	 crEBWULvp/2OXEQEklJDWUCqs3R7Hx1sl7ERAwsb93Nb72KUxIQy7kmRKJnozCjttSQ9PpXP2rvY
	 4noRbVOTWX+awyB5kAcXnATB3K89d3ayfbcOIgsao5r1sRPwusD5txf8iW7MPLJ9dUSJ5tqNIi46
	 HovOAO0UHyzifjQpxGX9aqmaDAhNCR1GMENpv3reHYh9FKsDGDQdonwlk+UOVZ1SAjUwxAoo74fe
	 vbOP4ktoSklkS+TPP7P5nFmr8nb9eG+7DBOncwcrX9WiACowb4pIf/1F0QzLVxEJbhj50glf85C3
	 D35LV6NinSWfZDzO/6ap5bUVUR9wwmS7FY8DgwugpbHm3vNL+LFoOEF8TEEoHA7nv+xoOztTosah
	 eCak5QDzrgR0DW+3Gaagjx8sgDKkY7XJ1+w+2DIcPKDVoWj1Y/wtyZUo43nOSjPXE5N+OS/6d0bZ
	 AUhIu4/eK3aKiG7bSjGpMJyioSjuECmo51yYVeZnH2HENyatP6FDHAGcyv7horoeN1LyGTrUyBa0
	 9hhoefP2f52pufgeBrPWHjXI+oaC4XjhEbHhyNpK8cU0y1xgjZbzmod//aRtx70ytyInLBicVsVU
	 px8bAcShNyGA9t7r0pR73o/g6PaWgrjNWWmZ/vB5mJ4sWWpVj3nFZw5+MZfNUJpeHqV1N8ADZ5zI
	 OireMov49WygRZADVt2UbfgCEqwaOdt/cWKPyH3nFyfNgFyxXcWieqpSg/ADZfOhhOZhjiARER9t
	 xLLqmLORqbwud9k4pujDn6slsqaiB4aDugF6nwY3iZa9Pr1n0Qjvy2OY5mK6ZLlfl/MVjHj2BsMc
	 RHs7dLT3sIQ3FcqnN5zEAxrCA+mEMv4Gsk9mtrCxXThLl/XyTm
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Edward Adam Davis <eadavis@qq.com>
To: gregkh@linuxfoundation.org
Cc: eadavis@qq.com,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	me@jackdoan.com,
	sashiko-bot@kernel.org,
	sashiko-reviews@lists.linux.dev,
	savicaleksa83@gmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH v4] hwmon: (aquacomputer_d5next) valid the data size before reading the sensor data
Date: Sat, 22 Aug 2026 21:03:52 +0800
X-OQ-MSGID: <20260822130351.88982-2-eadavis@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026082209-vacancy-duly-c136@gregkh>
References: <2026082209-vacancy-duly-c136@gregkh>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 22 Aug 2026 14:45:27 +0200, Greg KH wrote:
> On Sat, Aug 22, 2026 at 08:23:35PM +0800, Edward Adam Davis wrote:
> > On Sat, 22 Aug 2026 13:55:35 +0200, Greg KH wrote:
> > > On Sat, Aug 22, 2026 at 07:34:35PM +0800, Edward Adam Davis wrote:
> > > > The user-forged sensor data is only 65 bytes long; however, aqc_raw_event()
> > > > fails to handle cases where the sensor data length is too small when reading
> > > > the data, resulting in [1] during the read process.
> > >
> > > What is "user-forged sensor data"?
> > It is the data constructed within the reproducer.
> 
> What "reproducer"?
The complete reproducer:
https://syzkaller.appspot.com/x/repro.c?x=15a22549580000

Code for constructing the data:
   memcpy((void*)0x200000000500, 
           "\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"
           "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"
           "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"
           "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00",
           65);
    syz_usb_ep_write(/*fd=*/r[0], /*ep=*/0x81, /*len=*/0x41,
                     /*data=*/0x200000000500);
> 
> > > > Fixes: 0e35f63f7f4e ("hwmon: add driver for Aquacomputer D5 Next")
> > > > Reported-by: syzbot+9ee5f5dc18673d6b2f37@syzkaller.appspotmail.com
> > > > Closes: https://syzkaller.appspot.com/bug?extid=9ee5f5dc18673d6b2f37
> > > > Tested-by: syzbot+9ee5f5dc18673d6b2f37@syzkaller.appspotmail.com
> > > > Signed-off-by: Edward Adam Davis <eadavis@qq.com>
> > > > ---
> > >
> > > Was the Assisted-by: tag forgotten?
> > No one has assisted me so far; also, I haven't used this type of tag before.
> 
> No LLM was used?
No.
> 
> > > > +/* aqc_raw_data_valid()
> > > > + * Does not support special-case sensor readings data size check
> > >
> > > Why not?
> > It would be more appropriate for the maintainers of these sensors to add
> > the relevant checks.
> 
> Why?  Shouldn't that be covered here?
Perhaps I didn't express myself clearly enough; it should be included here,
but it would be best if someone familiar with Special-case sensors followed
up to add the details.
> 
> > > > + */
> > > > +static bool aqc_raw_data_valid(struct aqc_data *priv, int size)
> > > > +{
> > > > +	int off, fan_off, i;
> > > > +	char *msg;
> > > > +
> > > > +	if (!priv)
> > > > +		return false;
> > > > +
> > > > +	/* +1 for get_unaligned_be16(), it reads 2 bytes */
> > > > +	off = priv->serial_number_start_offset + SERIAL_PART_OFFSET + 1;
> > > > +	if (off >= size) {
> > > > +		msg = "serial number start offset";
> > >
> > > That's a lot of debugging code being added, why?  Who is going to use
> > > that?
> > I am not certain that these debug messages are definitely useful;
> > I simply included them because I felt they might be helpful.
> 
> If you didn't use them when debugging this code, why would it be needed
> by anyone else?
That makes perfect sense; I will remove them.

BR,
Edward

