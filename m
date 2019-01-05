From: Nicolin Chen <nicoleotsuka@gmail.com>
To: linux-hwmon@vger.kernel.org
Date: Fri, 04 Jan 2019 18:48:37 -0800
Subject: Re: [PATCH 2/2] hwmon: (ina3221) Implement ti,single-shot DT property
In-Reply-To: <20190105004904.17947-1-nicoleotsuka@gmail.com>
Message-ID: <20190105024823.GA20936@Asurada-Nvidia.nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

On Fri, Jan 04, 2019 at 06:37:55PM -0800, Guenter Roeck wrote:
> > +enum ina3221_modes {
> > +   INA3221_MODE_SINGLE_SHOT,
> > +   INA3221_MODE_CONTINUOUS,
> > +   INA3221_NUM_MODES,
> 
> Is NUM_MODES used anywhere ? Please drop unless there is a reason to keep it.

Will clean it up in v2.

Thanks
Nicolin
