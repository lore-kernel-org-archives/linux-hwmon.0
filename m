Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="ZZuYyHHL"
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CAC91732
	for <linux-hwmon@vger.kernel.org>; Fri,  8 Dec 2023 05:57:47 -0800 (PST)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 5248424002A
	for <linux-hwmon@vger.kernel.org>; Fri,  8 Dec 2023 14:57:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1702043864; bh=MqMA5eXxYSHMs5eMUtbebE4rmWa8231Kz2vpnDkYL1M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=ZZuYyHHLhfuqU7oGpQ1wR/NUVz/LV0NQ0JvJ3OCUKRvRHYt3qZJeKZJGapO+k6bxT
	 4BMEfqHWEZQZS/1SrMk2zIbqnnSbsq/hIbxDhr4nK/fqS88jsV7LmIIlAXFvOL6zge
	 epAqHYvuvfAZkyZaSumezdLNFYXbNgU0k+nY/7+4RwT+lenrz99lXxVz9gTOBkwiN1
	 SHDf/omKx/qDRwIvhqoKm5OtWMoh8PZKg/glSAoqD3FRMIqeLxhBcr5qNs298WZ704
	 t9qZ3WCcptCTDT3Gdk15Pm+Q6TdfVD0Q5r3V5/03FKlqKyYFWe4uocjgCODxzEDfQk
	 iZOOaTlI0JmzQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Smt4l2Gnvz6txp;
	Fri,  8 Dec 2023 14:57:43 +0100 (CET)
Date: Fri,  8 Dec 2023 13:57:42 +0000
From: Wilken Gottwalt <wilken.gottwalt@posteo.net>
To: Aleksa Savic <savicaleksa83@gmail.com>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Guenter
 Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (corsair-psu) Fix failure to load when built-in
 to kernel
Message-ID: <20231208145742.6def047a@posteo.net>
In-Reply-To: <d91d4bf1-3e8d-4b63-baa9-479a91d04eb7@gmail.com>
References: <20231208130710.191420-1-savicaleksa83@gmail.com>
	<d91d4bf1-3e8d-4b63-baa9-479a91d04eb7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 8 Dec 2023 14:11:44 +0100
Aleksa Savic <savicaleksa83@gmail.com> wrote:

> On 2023-12-08 14:07:10 GMT+01:00, Aleksa Savic wrote:
> > When built-in to the kernel, the corsair-psu driver fails to register with
> > the following message:
> > 
> > "Driver 'corsair-psu' was unable to register with bus_type 'hid'
> > because the bus was not initialized."
> > 
> > Fix this by initializing the driver after the HID bus using
> > late_initcall(), as hwmon is built before HID.
> > 
> > Fixes: d115b51e0e56 ("hwmon: add Corsair PSU HID controller driver")
> > Signed-off-by: Aleksa Savic <savicaleksa83@gmail.com>
> > ---
> >  drivers/hwmon/corsair-psu.c | 15 ++++++++++++++-
> >  1 file changed, 14 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
> > index 904890598c11..48831a528965 100644
> > --- a/drivers/hwmon/corsair-psu.c
> > +++ b/drivers/hwmon/corsair-psu.c
> > @@ -899,7 +899,20 @@ static struct hid_driver corsairpsu_driver = {
> >  	.reset_resume	= corsairpsu_resume,
> >  #endif
> >  };
> > -module_hid_driver(corsairpsu_driver);
> > +
> > +static int __init corsairpsu_hid_init(void)
> > +{
> > +	return hid_register_driver(&corsairpsu_driver);
> > +}
> > +
> > +static void __exit corsairpsu_hid_exit(void)
> > +{
> > +	hid_unregister_driver(&corsairpsu_driver);
> > +}
> > +
> > +/* When compiled into the kernel, initialize after the hid bus */
> > +late_initcall(corsairpsu_hid_init);
> > +module_exit(corsairpsu_hid_exit);
> >  
> >  MODULE_LICENSE("GPL");
> >  MODULE_AUTHOR("Wilken Gottwalt <wilken.gottwalt@posteo.net>");
> 
> 
> Woops! Just saw that the same fix was sent yesterday. Please disregard, sorry!
>
> Aleksa

It is fine. I just start to wonder if there was a change in the subsystem. I
used the driver as built-in in the past for several months and never had that
issue. And now it is a real flood of reports.

greetings,
Will
