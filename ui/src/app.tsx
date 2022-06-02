import React, { useEffect, useState } from 'react';
import Urbit from '@urbit/http-api';
import { Charges, ChargeUpdateInitial, scryCharges } from '@urbit/api';
import { AppTile } from './components/AppTile';
import { AScreen, Pixel } from './components/Pixel';
import { render } from 'react-dom';
import { Stage, Layer, Rect, Text } from 'react-konva';
import Konva from 'konva';

const api = new Urbit('', '', window.desk);
api.ship = window.ship;

export interface ScreenBlit {
  'screen-state': Array<Array<Number>>;
}
export declare type ScreenUpdate = ScreenBlit
export interface Screen {
  screenState: Array<Array<Number>>;
}


export function App() {
  const [apps, setApps] = useState<Charges>();
  const [screen, setScreen] = useState<Screen>();

  useEffect(() => {
    async function init() {
      console.log(scryCharges)
      const charges = (await api.scry<ChargeUpdateInitial>(scryCharges)).initial;
      const screen_data = (await api.scry<ScreenUpdate>({'app': 'screen', 'path': '/screen'}));
      console.log(screen_data);
      setApps(charges);
      setScreen({screenState: screen_data['screen-state']});
      try {
      api.subscribe({
        app:  'screen',
        path: '/updates',
        event: update,
        err: () => console.log('error'),
        quit: () => console.log('quit')
      });
    } catch {
      console.log('error subscribing to screen updates');
    }
    }

    async function update(upd ) {
      console.log(upd)
      setScreen({screenState: upd['screen-state']});
    }
    init();

  }, []);

  

  return (
    <main className="flex items-center justify-center min-h-screen">
      <div className="max-w-md space-y-6 py-20">
        <h1 className="text-3xl font-bold">Welcome to screen</h1>
        <p>The Screen</p>
        {screen && (
          <AScreen screenState={screen.screenState} />
        )}
      </div>
    </main>
  );
}
