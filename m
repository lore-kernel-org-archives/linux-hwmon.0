Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-vk0-f48.google.com ([209.85.213.48]:34625 "EHLO
	mail-vk0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932751AbcFGQbI (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>); Tue, 7 Jun 2016 12:31:08 -0400
Received: by mail-vk0-f48.google.com with SMTP id e4so113861596vkb.1
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Jun 2016 09:31:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160525170912.GA24382@rob-hp-laptop>
References: <1463415447-29903-1-git-send-email-hotran@apm.com>
	<1463415447-29903-2-git-send-email-hotran@apm.com>
	<20160523203044.GA17450@rob-hp-laptop>
	<CAFHUOYyYt8pE6sggezCR=TFcsimcjakbYmcWFtpLyQ3Et_gZaA@mail.gmail.com>
	<20160525170912.GA24382@rob-hp-laptop>
Date: Tue, 7 Jun 2016 09:31:07 -0700
Message-ID: <CAFHUOYwrpc=ad_iEjx2LYdTQPGkzu76sfXcnp+-cpUZAvFvcag@mail.gmail.com>
Subject: Re: [PATCH 1/3] Documentation: dtb: xgene: Add hwmon dts binding documentation
From: Hoan Tran <hotran@apm.com>
To: Rob Herring <robh@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Ashwin Chaugule <ashwin.chaugule@linaro.org>,
	Duc Dang <dhdang@apm.com>, Loc Ho <lho@apm.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	lkml <linux-kernel@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Rob,

On Wed, May 25, 2016 at 10:09 AM, Rob Herring <robh@kernel.org> wrote:
>
> On Mon, May 23, 2016 at 06:01:14PM -0700, Hoan Tran wrote:
> > Hi Rob,
> >
> > Thanks for your review !
> >
> > On Mon, May 23, 2016 at 1:30 PM, Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Mon, May 16, 2016 at 09:17:25AM -0700, Hoan Tran wrote:
> > > > This patch adds the APM X-Gene hwmon device tree node documentation.
> > > >
> > > > Signed-off-by: Hoan Tran <hotran@apm.com>
> > > > ---
> > > >  .../devicetree/bindings/hwmon/apm-xgene-hwmon.txt          | 14 ++++++++++++++
> > > >  1 file changed, 14 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/hwmon/apm-xgene-hwmon.txt
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/hwmon/apm-xgene-hwmon.txt b/Documentation/devicetree/bindings/hwmon/apm-xgene-hwmon.txt
> > > > new file mode 100644
> > > > index 0000000..49a482e
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/hwmon/apm-xgene-hwmon.txt
> > > > @@ -0,0 +1,14 @@
> > > > +APM X-Gene hwmon driver
> > > > +
> > > > +Hwmon driver accesses sensors over the "SLIMpro" mailbox.
> > >
> > > DT bindings describe h/w, not driver data.
> > How about this description: "APM X-Gene SOC sensors are accessed over
> > the "SLIMpro" mailbox" ?
> > > I'm not sure this belongs in
> > > DT and perhaps the devices for the mailbox should be created by the
> > > mailbox driver.
> > I don't think the current mailbox supports it.
>
> Then add it. The mailbox binding is really only needed when other h/w
> blocks use a mailbox. As this is purely a firmware interface then the
> mailbox driver can create any devices it needs. The devices don't have
> to be in DT to be created.

Yes, I'll create a function inside mailbox. It allows client request a
channel by mailbox name and index without DT node.

Thanks
Hoan


>
>
> Rob
