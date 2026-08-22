Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CFD35975;
	Sat, 22 Aug 2026 12:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787402828; cv=none; b=q/8wCQzN/1ggawxtibnWvY/99DruQF2YPMNTOjxVV29A7oxwcfknemeyOWAD+1D0yBW/kmWPGFP+SZUy3hY0nrWoXKAUB5R12kHEDNjDvY/gLbIyRgY1Xdn5/EJ1NFQgMfwTsIEXYmrHDTF22qS1qiuXWPpsruieEP+jsi5w2JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787402828; c=relaxed/simple;
	bh=HtM5eVQ1z/b+tb1Z89n59U/5RaRK//qvB+Ll/z3coS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oJx1r9JyaZrvwp8caVxdG9oiVSM8F9ja+9G1rwKuN6ScFOpWg0iCnD2cwQmarVl7sZKlMq0nYoG/2oR5wc1KpjsLVoPXFgKc8w+V2l2B7ScQ6Pz/pq8f1kEzdCVVwyMGXLdjhrgaRPqxLuKee5BDsGuAhcfYD91d7bGFTCfh5/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xQ2MOaoT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xQ2MOaoT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D0F11F000E9;
	Sat, 22 Aug 2026 12:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787402826;
	bh=frTG55SvrVC9y45R/YnKk36Z3MCfbTbTXB17VF2Y1rQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=xQ2MOaoToG0eQwOi55LhsIytPX2OuNhRmtbuQB/1E7JMny5VL7W99o9OoNWOwPHz4
	 PajJUKXdVmE9iwx4QSu9Gg60aCQ/Ez7Htj8+LDX+aih1RFZWPeLY0s1rLabyTTylUe
	 ttsMPQ9zY3abz90j4v3I3pEv4reagzYN6uU457oU=
Date: Sat, 22 Aug 2026 14:45:27 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Edward Adam Davis <eadavis@qq.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, me@jackdoan.com, sashiko-bot@kernel.org,
	sashiko-reviews@lists.linux.dev, savicaleksa83@gmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH v4] hwmon: (aquacomputer_d5next) valid the data size
 before reading the sensor data
Message-ID: <2026082209-vacancy-duly-c136@gregkh>
References: <2026082252-clerk-anointer-ceaf@gregkh>
 <tencent_71B8A5DC0D8A9202DDCBDDA4990FCF928D07@qq.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_71B8A5DC0D8A9202DDCBDDA4990FCF928D07@qq.com>

On Sat, Aug 22, 2026 at 08:23:35PM +0800, Edward Adam Davis wrote:
> On Sat, 22 Aug 2026 13:55:35 +0200, Greg KH wrote:
> > On Sat, Aug 22, 2026 at 07:34:35PM +0800, Edward Adam Davis wrote:
> > > The user-forged sensor data is only 65 bytes long; however, aqc_raw_event()
> > > fails to handle cases where the sensor data length is too small when reading
> > > the data, resulting in [1] during the read process.
> > 
> > What is "user-forged sensor data"?
> It is the data constructed within the reproducer.

What "reproducer"?

> > > Fixes: 0e35f63f7f4e ("hwmon: add driver for Aquacomputer D5 Next")
> > > Reported-by: syzbot+9ee5f5dc18673d6b2f37@syzkaller.appspotmail.com
> > > Closes: https://syzkaller.appspot.com/bug?extid=9ee5f5dc18673d6b2f37
> > > Tested-by: syzbot+9ee5f5dc18673d6b2f37@syzkaller.appspotmail.com
> > > Signed-off-by: Edward Adam Davis <eadavis@qq.com>
> > > ---
> > 
> > Was the Assisted-by: tag forgotten?
> No one has assisted me so far; also, I haven't used this type of tag before.

No LLM was used?

> > > +/* aqc_raw_data_valid()
> > > + * Does not support special-case sensor readings data size check
> > 
> > Why not?
> It would be more appropriate for the maintainers of these sensors to add
> the relevant checks.

Why?  Shouldn't that be covered here?

> > > + */
> > > +static bool aqc_raw_data_valid(struct aqc_data *priv, int size)
> > > +{
> > > +	int off, fan_off, i;
> > > +	char *msg;
> > > +
> > > +	if (!priv)
> > > +		return false;
> > > +
> > > +	/* +1 for get_unaligned_be16(), it reads 2 bytes */
> > > +	off = priv->serial_number_start_offset + SERIAL_PART_OFFSET + 1;
> > > +	if (off >= size) {
> > > +		msg = "serial number start offset";
> > 
> > That's a lot of debugging code being added, why?  Who is going to use
> > that?
> I am not certain that these debug messages are definitely useful;
> I simply included them because I felt they might be helpful.

If you didn't use them when debugging this code, why would it be needed
by anyone else?

thanks,

greg k-h
