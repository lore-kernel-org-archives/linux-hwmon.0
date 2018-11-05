Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-dm3nam03on0078.outbound.protection.outlook.com ([104.47.41.78]:63616
        "EHLO NAM03-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726902AbeKFFzG (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 6 Nov 2018 00:55:06 -0500
From: "Woods, Brian" <Brian.Woods@amd.com>
To: Borislav Petkov <bp@alien8.de>
CC: "Woods, Brian" <Brian.Woods@amd.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "x86@kernel.org" <x86@kernel.org>,
        Clemens Ladisch <clemens@ladisch.de>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Helgaas <bhelgaas@google.com>, Pu Wen <puwen@hygon.cn>,
        Jia Zhang <qianyue.zj@alibaba-inc.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [PATCH 2/4] x86/amd_nb: add support for newer PCI topologies
Date: Mon, 5 Nov 2018 20:33:34 +0000
Message-ID: <20181105203330.GB27399@amd.com>
References: <20181102181055.130531-1-brian.woods@amd.com>
 <20181102181055.130531-3-brian.woods@amd.com>
 <20181105193840.GA26868@zn.tnic>
In-Reply-To: <20181105193840.GA26868@zn.tnic>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3DC06219AAEE0E44B03F5EBADAC5E325@namprd12.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Nov 05, 2018 at 08:38:40PM +0100, Borislav Petkov wrote:
> On Fri, Nov 02, 2018 at 06:11:07PM +0000, Woods, Brian wrote:
> > Add support for new processors which have multiple PCI root complexes
> > per data fabric/SMN interface.
>=20
> Please write out abbreviations. I believe it is only you and I who know
> what SMN means. :)

Will do.

> > The interfaces per root complex are redundant and should be skipped.
>=20
> And I believe it is only you who understands that sentence. :)
>=20
> Please elaborate why interfaces need to be skipped, *which* interfaces
> need to be skipped and which is the correct interface to access DF/SMN
> through?

See last comment.

> > This makes sure the DF/SMN interfaces get accessed via the correct
> > root complex.
> >
> > Ex:
> > DF/SMN 0 -> 60
> > 	    40
> > 	    20
> > 	    00
> > DF/SMN 1 -> e0
> > 	    c0
> > 	    a0
> > 	    80
> >=20
> > Signed-off-by: Brian Woods <brian.woods@amd.com>
> > ---
> >  arch/x86/kernel/amd_nb.c | 41 +++++++++++++++++++++++++++++++++++-----=
-
> >  1 file changed, 35 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/arch/x86/kernel/amd_nb.c b/arch/x86/kernel/amd_nb.c
> > index 19d489ee2b1e..c0bf26aeb7c3 100644
> > --- a/arch/x86/kernel/amd_nb.c
> > +++ b/arch/x86/kernel/amd_nb.c
> > @@ -213,7 +213,10 @@ int amd_cache_northbridges(void)
> >  	const struct pci_device_id *root_ids =3D amd_root_ids;
> >  	struct pci_dev *root, *misc, *link;
> >  	struct amd_northbridge *nb;
> > -	u16 i =3D 0;
> > +	u16 roots_per_misc =3D 0;
> > +	u16 misc_count =3D 0;
> > +	u16 root_count =3D 0;
> > +	u16 i, j;
> > =20
> >  	if (amd_northbridges.num)
> >  		return 0;
> > @@ -226,26 +229,52 @@ int amd_cache_northbridges(void)
> > =20
> >  	misc =3D NULL;
> >  	while ((misc =3D next_northbridge(misc, misc_ids)) !=3D NULL)
> > -		i++;
> > +		misc_count++;
> > =20
> > -	if (!i)
> > +	root =3D NULL;
> > +	while ((root =3D next_northbridge(root, root_ids)) !=3D NULL)
> > +		root_count++;
> > +
> > +	if (!misc_count)
> >  		return -ENODEV;
>=20
> So you're doing the root_count above but returning in the !misc_count
> case. So that root_count iteration was unnecessary work. IOW, you should
> keep the misc_count check after its loop.

I think having them togeter is cleaner. If you aren't finding any
misc IDs, I highly doubt you'll find any root IDs.  There shouldn't
be much of a difference in how fast the function exits, either way.
If you want it the other way though, I don't mind changing it.

> > =20
> > -	nb =3D kcalloc(i, sizeof(struct amd_northbridge), GFP_KERNEL);
> > +	if (root_count) {
> > +		roots_per_misc =3D root_count / misc_count;
> > +
> > +		/*
> > +		 * There should be _exactly_ N roots for each DF/SMN
> > +		 * interface.
> > +		 */
> > +		if (!roots_per_misc || (root_count % roots_per_misc)) {
> > +			pr_info("Unsupported AMD DF/PCI configuration found\n");
> > +			return -ENODEV;
> > +		}
> > +	}
> > +
> > +	nb =3D kcalloc(misc_count, sizeof(struct amd_northbridge), GFP_KERNEL=
);
> >  	if (!nb)
> >  		return -ENOMEM;
> > =20
> >  	amd_northbridges.nb =3D nb;
> > -	amd_northbridges.num =3D i;
> > +	amd_northbridges.num =3D misc_count;
> > =20
> >  	link =3D misc =3D root =3D NULL;
> > -	for (i =3D 0; i !=3D amd_northbridges.num; i++) {
> > +	for (i =3D 0; i < amd_northbridges.num; i++) {
> >  		node_to_amd_nb(i)->root =3D root =3D
> >  			next_northbridge(root, root_ids);
> >  		node_to_amd_nb(i)->misc =3D misc =3D
> >  			next_northbridge(misc, misc_ids);
> >  		node_to_amd_nb(i)->link =3D link =3D
> >  			next_northbridge(link, link_ids);
> > +
> > +		/*
> > +		 * If there are more root devices than data fabric/SMN,
> > +		 * interfaces, then the root devices per DF/SMN
> > +		 * interface are redundant and N-1 should be skipped so
> > +		 * they aren't mapped incorrectly.
> > +		 */
>=20
> This text is trying to explain it a bit better but you still still need
> to specify which are the redundant ones. All N-1 or is there a special
> root device through which the DF/SMN gets accessed or?
>=20
> Thx.
Would

		/*
		 * If there are more PCI root devices than data fabric/
		 * system management network interfaces, then the (N)
		 * PCI roots per DF/SMN interface are functionally the
		 * same (for DF/SMN access) and N-1 are redundant.  The
		 * N-1 PCI roots should be skipped per DF/SMN interface
		 * so the DF/SMN interfaces get mapped to the correct
		 * PCI root.
		 */

be better?  I would update the commit msg also.

> --=20
> Regards/Gruss,
>     Boris.
>=20
> Good mailing practices for 400: avoid top-posting and trim the reply.

--=20
Brian Woods
